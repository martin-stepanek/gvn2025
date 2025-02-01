// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'dart:async';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

// Use our own version of the Health package from Github
// In pubspec.yaml, change health: ^10.2.0 (or whichever version is there) to
/*
  health:
    git:
      url: https://github.com/martin-stepanek/VitalityHealthPackage.git
      ref: main # branch name
*/
// originalOffset is timezone offset when the user started their
// journey (i.e. before a potential time change)

// When running this through the background service on Android, permission requests
// need to be avoided due to a limitation in the PermissionHandler package

// REMEMBER TO EXCLUDE THIS CODE FROM COMPILATION

Future<List<CombinedDataStruct>?> getDataAppleHealth(
    DateTime startDate,
    DateTime endDate,
    int originalOffset,
    List<String> dataTypes,
    DocumentReference userRef,
    bool? requestPermissions) async {
  requestPermissions = requestPermissions ?? true;

  print('Fetching data from Apple Health or Google Fit...');

  Health().configure(useHealthConnectIfAvailable: true);

  // There is sometimes an error with start date when we change it manually in
  // the database, adding a few milliseconds. Let's make sure it is a proper midnight
  startDate = DateTime.utc(startDate.year, startDate.month, startDate.day)
      .add(Duration(hours: -originalOffset));

  List<CombinedDataStruct> returnData = [];
  List<Map<String, dynamic>> healthDataAggregated = [];

  List<HealthDataPoint> healthDataList = [];
  List<Map<DateTime, int>?> stepDataList = [];
  List<Map<DateTime, double>?> basalEnergyList = [];
  List<Map<DateTime, double>?> activeEnergyList = [];
  List<Map<DateTime, double>?> totalSleepList = [];
  List<Map<DateTime, double>?> awakeSleepList = [];
  List<Map<DateTime, double>?> deepSleepList = [];
  List<Map<DateTime, double>?> remSleepList = [];
  List<Map<DateTime, double>?> lightSleepList = [];
  List<Map<DateTime, double>?> standingHoursList = [];
  Map<DateTime, DateTime>? sleepStartList = {};
  Map<DateTime, DateTime>? sleepEndList = {};

  // Create a function to fetch existing records for the given time range
  // Double-check that the method "queryPaDataRecordOnce" exists in
  // /lib/backend/backend.dart (the collection to query must be called
  // "paData" to be called the same
  Future<List<PaDataRecord>> _oldPaData =
      queryPaDataRecordOnce(parent: userRef);
  List<PaDataRecord> oldPaData = await _oldPaData;

  // Define the types to get
  List<HealthDataType> types = addDataTypes(dataTypes);

  // Get VO2 Max, HRV, Resting heart rate and various other metrics
  if (types.isNotEmpty) {
    if (requestPermissions) {
      // Requesting access to the data types before reading them
      // This is just to be sure; the permissions have already been granted at the registration

      // Apple Health does not provide information on permissions to read data due to security
      // concerns. This will always return true for iPhones

      // This is not necessary to ask each time since we already logged in when linking the activity tracker
      // Define permissions to ask for each data type
      var permissions = <HealthDataAccess>[];
      for (var t in types) {
        permissions.add(HealthDataAccess.READ);
      }
      await Health().requestAuthorization(types, permissions: permissions);
      // These are just for Android
      // await Permission.activityRecognition.request();
      // await Permission.location.request(); // Optional
    }

    print('Getting data...');
    List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
        types: types, startTime: startDate, endTime: endDate);
    healthDataList.addAll(healthData);
    healthDataList = Health().removeDuplicates(healthDataList);

    // There may be more than one reading per day for some metrics
    // Convert all such data to daily data in a way that if there is more
    // than one reading per day, use the difference between dateFrom and dateTo
    // as a weight for taking the average

    // Get the list of all unique typeString values
    List<String> uniqueTypes = [];
    for (var d in healthDataList) {
      if (!uniqueTypes.contains(d.typeString)) {
        uniqueTypes.add(d.typeString);
      }
    }
    print('Unique types: $uniqueTypes');

    Map<DateTime, Map<String, AggregateData>> aggregatedData = {};

    print('Aggregating data...');
    for (var d in healthDataList) {
      if (!(d.value is WorkoutHealthValue)) {
        DateTime eventDate = correctedDate(d.dateFrom, originalOffset);
        String type = d.typeString;

        // Adding the +1 is necessary because some metrics (VO2Max) have dateFrom = dateTo
        double weight =
            d.dateTo.difference(d.dateFrom).inMilliseconds.toDouble() + 1;

        if (!aggregatedData.containsKey(eventDate)) {
          aggregatedData[eventDate] = {};
        }

        if (!aggregatedData[eventDate]!.containsKey(type)) {
          aggregatedData[eventDate]![type] = AggregateData();
        }

        aggregatedData[eventDate]![type]!.addData(
            (d.value as NumericHealthValue).numericValue * 1.0, weight);
      }
    }

    aggregatedData.forEach((date, metrics) {
      Map<String, dynamic> dayData = {'eventDate': date};
      metrics.forEach((type, aggregateData) {
        dayData[type] = aggregateData.getWeightedAverage();
      });
      healthDataAggregated.add(dayData);
    });
  }

  print('Getting step data...');
  // Get step data
  if (dataTypes.contains("Steps")) {
    stepDataList +=
        await getSteps(startDate, endDate, originalOffset, requestPermissions);
  }

  print('Getting other data...');
  // Get calorie data
  if (dataTypes.contains("Energy burned")) {
    basalEnergyList += await getOtherData(
        startDate, endDate, 'energyBasal', originalOffset, requestPermissions);
    activeEnergyList += await getOtherData(
        startDate, endDate, 'energyActive', originalOffset, requestPermissions);
  }

  // Get number of hours standing
  if (dataTypes.contains("Exposure")) {
    standingHoursList += await getOtherData(startDate, endDate, 'standingHours',
        originalOffset, requestPermissions);
  }

  // Get sleep data
  // This works for Apple but appears unavailable for Google Fit
  if (dataTypes.contains("Sleep")) {
    awakeSleepList += await getOtherData(
        startDate.add(const Duration(hours: -12)),
        endDate,
        'sleepAwake',
        originalOffset,
        requestPermissions);
    deepSleepList += await getOtherData(
        startDate.add(const Duration(hours: -12)),
        endDate,
        'sleepDeep',
        originalOffset,
        requestPermissions);
    remSleepList += await getOtherData(
        startDate.add(const Duration(hours: -12)),
        endDate,
        'sleepREM',
        originalOffset,
        requestPermissions);
    lightSleepList += await getOtherData(
        startDate.add(const Duration(hours: -12)),
        endDate,
        'sleepLight',
        originalOffset,
        requestPermissions);
    var sleepStartAndEnd = await getSleepStartAndEnd(
        startDate.add(const Duration(hours: -12)),
        endDate,
        originalOffset,
        requestPermissions);
    sleepStartList = sleepStartAndEnd[0];
    sleepEndList = sleepStartAndEnd[1];
  }

  // Resting steps, heart rate, sleep, energy are on daily basis
  // Everything else can occur multiple times per day

  // All the other daily data points are in their separate list, we just need
  // to separate RESTING_HEART_RATE out
  var restingHeartRateData =
      healthDataList.where((u) => (u.typeString == 'RESTING_HEART_RATE'));

  // Since it's daily data, we can just go day by day
  // For ad hoc information (e.g., weight), we need to take a summary for the day
  // (otherwise we could have multiple data points per day). Let's go with average
  print('Creating combined data struct for daily data...');
  if (basalEnergyList.isNotEmpty |
      activeEnergyList.isNotEmpty |
      restingHeartRateData.isNotEmpty |
      remSleepList.isNotEmpty |
      deepSleepList.isNotEmpty |
      awakeSleepList.isNotEmpty |
      totalSleepList.isNotEmpty |
      lightSleepList.isNotEmpty |
      stepDataList.isNotEmpty) {
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      DateTime date =
          correctedDate(startDate, originalOffset).add(Duration(days: i));
      Map<String, dynamic>? x = healthDataAggregated.firstWhere(
          (e) => e['eventDate'] == date,
          orElse: () => <String, dynamic>{});
      if (x.isEmpty) {
        x = {};
      }

      // We want all data points to be set consistently to midnight in the timezone that
      // the user originally started in. To do this, we need to find the timezone offset
      // for each day separately. But first, we need to make sure that the day is correctly
      // recognised as the appropriate day in the user's current timezone (and not as the
      // day before). We do this through the correction

      var newData = createCombinedDataStruct(
        user: userRef,
        createdAt: getCurrentTimestamp,
        eventDate: date.add(Duration(hours: -originalOffset)),
        dataType: 'daily',
        sourceId: null,
        sourceName: null,
        platform: isAndroid ? 'Google Fit' : 'Apple Health',
        steps: selectData(stepDataList, date),
        energyTotal: ((selectData(activeEnergyList, date) == null) |
                (selectData(basalEnergyList, date) == null))
            ? null
            : selectData(basalEnergyList, date).round() +
                selectData(activeEnergyList, date).round(),
        energyActive: selectData(activeEnergyList, date).round(),
        energyResting: selectData(basalEnergyList, date).round(),
        heartRateResting: x.containsKey("RESTING_HEART_RATE")
            ? x['RESTING_HEART_RATE'].round()
            : null,
        hrvDaily: x.containsKey('HEART_RATE_VARIABILITY_SDNN')
            ? x['HEART_RATE_VARIABILITY_SDNN']
            : null,
        hrvUnit: 'SDNN',
        sleepTotal: (selectData(lightSleepList, date) +
                selectData(deepSleepList, date) +
                selectData(remSleepList, date))
            .round(),
        sleepDeep: selectData(deepSleepList, date).round(),
        sleepLight: selectData(lightSleepList, date).round(),
        sleepRem: selectData(remSleepList, date).round(),
        sleepAwake: selectData(awakeSleepList, date).round(),
        sleepStart: sleepStartList?[date],
        sleepEnd: sleepEndList?[date],
        vo2Max: x.containsKey('VO2MAX') ? x['VO2MAX'] : null,
        weight: x.containsKey('WEIGHT') ? x['WEIGHT'] : null,
        height: x.containsKey('HEIGHT') ? x['HEIGHT'] : null,
        bmi: x.containsKey('BODY_MASS_INDEX') ? x['BODY_MASS_INDEX'] : null,
        bodyFat: x.containsKey('BODY_FAT_PERCENTAGE')
            ? x['BODY_FAT_PERCENTAGE']
            : null,
        waist: x.containsKey('WAIST_CIRCUMFERENCE')
            ? x['WAIST_CIRCUMFERENCE']
            : null,
        spo2Avg: x.containsKey('BLOOD_OXYGEN') ? x['BLOOD_OXYGEN'] : null,
        breathingRate:
            x.containsKey('RESPIRATORY_RATE') ? x['RESPIRATORY_RATE'] : null,
        bpSystolic: x.containsKey('BLOOD_PRESSURE_SYSTOLIC')
            ? x['BLOOD_PRESSURE_SYSTOLIC']
            : null,
        bpDiastolic: x.containsKey('BLOOD_PRESSURE_DIASTOLIC')
            ? x['BLOOD_PRESSURE_DIASTOLIC']
            : null,
        // timeInDaylight: x.containsKey('TIME_IN_DAYLIGHT') ? x['TIME_IN_DAYLIGHT'] : null,
        standHours: selectData(standingHoursList, date) * 1.0,
        // standingMinutes: x.containsKey('STANDING') ? x['STANDING'] : null,
      );

      returnData.add(newData);
    }
  }

  print('Creating combined data struct for workout data...');
  // For workouts, just save them one by one
  for (var d in healthDataList.where((u) => (u.value is WorkoutHealthValue))) {
    // Workouts need to be treated separately since all the workout information
    // is in the value attribute
    if (d.value is WorkoutHealthValue) {
      WorkoutHealthValue dj = (d.value as WorkoutHealthValue);
      DateTime date = d.dateFrom;

      var newData = createCombinedDataStruct(
        user: userRef,
        createdAt: getCurrentTimestamp,
        eventDate: correctedDate(date, originalOffset)
            .add(Duration(hours: -originalOffset)),
        dataType: 'workout',
        sourceId: d.sourceId,
        sourceName: d.sourceName,
        platform: isAndroid ? 'Google Fit' : 'Apple Health',
        workoutCalories: dj.totalEnergyBurned,
        workoutDistance: dj.totalDistance?.toDouble(),
        workoutDuration: d.dateTo.difference(d.dateFrom).inSeconds / 60,
        workoutType: dj.workoutActivityType.toString(),
        // workoutHeartRateAverage: ,
        // workoutHeartRateMax: ,
        // workoutHeartRateRelative: ,
        // workoutManualEntry: ,
      );

      returnData.add(newData);
    }
  }

  print("Uploading data to the database...");

  for (var newData in returnData) {
    addPaData(newData, oldPaData, originalOffset, userRef);
  }

  checkIfTodayDataExists(returnData, originalOffset, userRef);

  return returnData;
}

Future<List<Map<DateTime, int>?>> getSteps(DateTime startDate, DateTime endDate,
    int originalOffset, bool requestPermissions) async {
  List<Map<DateTime, int>?> stepDataList = [];

  var types = <HealthDataType>[];
  var permissions = <HealthDataAccess>[];

  types.add(HealthDataType.STEPS);
  permissions.add(HealthDataAccess.READ);

  if (requestPermissions) {
    await Health().requestAuthorization(types, permissions: permissions);
    await Permission.activityRecognition.request();
  }

  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    int? steps = await Health().getTotalStepsInInterval(
        startDate.add(Duration(days: i)), startDate.add(Duration(days: i + 1)));
    if (steps != null) {
      stepDataList.add({
        correctedDate(startDate, originalOffset).add(Duration(days: i)): steps
      });
    }
  }

  return stepDataList;
}

Future<List<Map<DateTime, double>?>> getOtherData(
  DateTime startDate,
  DateTime endDate,
  String dataType,
  int originalOffset,
  bool requestPermissions,
) async {
  List<Map<DateTime, double>?> returnDataList = [];
  List<HealthDataPoint> healthDataList = [];

  var types = <HealthDataType>[];
  var permissions = <HealthDataAccess>[];

  if (dataType == 'energyActive') {
    types.add(HealthDataType.ACTIVE_ENERGY_BURNED);
    permissions.add(HealthDataAccess.READ);
  } else if (dataType == 'standingHours') {
    types.add(HealthDataType.STAND_HOURS);
    permissions.add(HealthDataAccess.READ);
  } else if (dataType == 'energyBasal') {
    types.add(HealthDataType.BASAL_ENERGY_BURNED);
    permissions.add(HealthDataAccess.READ);
  } else if (dataType == 'sleepAwake') {
    types.add(HealthDataType.SLEEP_AWAKE);
    permissions.add(HealthDataAccess.READ);
  } else if (dataType == 'sleepDeep') {
    types.add(HealthDataType.SLEEP_ASLEEP_DEEP);
    permissions.add(HealthDataAccess.READ);
  } else if (dataType == 'sleepREM') {
    types.add(HealthDataType.SLEEP_ASLEEP_REM);
    permissions.add(HealthDataAccess.READ);
  } else if (dataType == 'sleepLight') {
    types.add(HealthDataType.SLEEP_ASLEEP_CORE);
    permissions.add(HealthDataAccess.READ);
  }

  if (requestPermissions) {
    await Health().requestAuthorization(types, permissions: permissions);
    await Permission.activityRecognition.request();
  }

  List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
      types: types, startTime: startDate, endTime: endDate);
  healthDataList.addAll(healthData);
  healthDataList = Health().removeDuplicates(healthDataList);

  if (!['sleepAwake', 'sleepDeep', 'sleepREM', 'sleepLight']
      .contains(dataType)) {
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      double data = 0;
      if (healthDataList.isNotEmpty) {
        healthDataList.forEach((e) {
          if ((!e.dateFrom.isBefore(startDate.add(Duration(days: i)))) &
              (!e.dateTo.isAfter(startDate.add(Duration(days: i + 1))))) {
            data += (e.value as NumericHealthValue).numericValue * 1.0;
          }
        });
        returnDataList.add({
          correctedDate(startDate, originalOffset).add(Duration(days: i)): data
        });
      }
    }
  } else {
    // As of Health 10.2.0, sleep values appear to be wrong (the NumericHealthValue
    // doesn't correspond to the number of minutes spent sleeping). Using the time range
    // that the sleep data corresponds to instead

    // Sleep needs to be added per night, not per day
    // Note that the first data point will be understated
    Map<DateTime, double> aggregatedData = {};

    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      DateTime day =
          correctedDate(startDate, originalOffset).add(Duration(days: i));
      DateTime dayNoon = day.add(const Duration(hours: -12));

      if (healthDataList.isNotEmpty) {
        for (var d in healthDataList) {
          if (d.dateFrom.isAfter(dayNoon) &&
              d.dateTo.isBefore(dayNoon.add(const Duration(days: 1)))) {
            if (!aggregatedData.containsKey(day)) {
              aggregatedData[day] = 0;
            }
            aggregatedData[day] = aggregatedData[day]! +
                d.dateTo.difference(d.dateFrom).inMinutes;
            // (d.value as NumericHealthValue).numericValue * 1.0;
          }
        }
      }
    }

    aggregatedData.forEach((date, sum) {
      returnDataList.add({date: sum});
    });
  }
  return returnDataList;
}

Future<List<Map<DateTime, DateTime>?>> getSleepStartAndEnd(
  DateTime startDate,
  DateTime endDate,
  int originalOffset,
  bool requestPermissions,
) async {
  Map<DateTime, DateTime>? sleepStartList = {};
  Map<DateTime, DateTime>? sleepEndList = {};
  List<HealthDataPoint> healthDataList = [];

  var types = <HealthDataType>[];
  var permissions = <HealthDataAccess>[];

  types.add(HealthDataType.SLEEP_ASLEEP_DEEP);
  permissions.add(HealthDataAccess.READ);
  types.add(HealthDataType.SLEEP_ASLEEP_REM);
  permissions.add(HealthDataAccess.READ);
  types.add(HealthDataType.SLEEP_ASLEEP_CORE);
  permissions.add(HealthDataAccess.READ);

  if (requestPermissions) {
    await Health().requestAuthorization(types, permissions: permissions);
    await Permission.activityRecognition.request();
  }

  List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
      types: types, startTime: startDate, endTime: endDate);
  healthDataList.addAll(healthData);
  healthDataList = Health().removeDuplicates(healthDataList);

  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    DateTime day =
        correctedDate(startDate, originalOffset).add(Duration(days: i));
    DateTime dayNoon = day.add(const Duration(hours: -12));

    if (healthDataList.isNotEmpty) {
      for (var d in healthDataList) {
        if (d.dateFrom.isAfter(dayNoon) &&
            d.dateTo.isBefore(dayNoon.add(const Duration(days: 1)))) {
          if (!sleepStartList.containsKey(day)) {
            sleepStartList[day] = d.dateFrom;
          } else if (sleepStartList[day]!.isAfter(d.dateFrom)) {
            sleepStartList[day] = d.dateFrom;
          }
          if (!sleepEndList.containsKey(day)) {
            sleepEndList[day] = d.dateTo;
          } else if (sleepEndList[day]!.isBefore(d.dateTo)) {
            sleepEndList[day] = d.dateTo;
          }
        }
      }
    }
  }

  return [sleepStartList, sleepEndList];
}

// Function to allocate the right data point the downloaded data
dynamic selectData(List<dynamic> dataList, DateTime date) {
  var x = dataList.where((u) => (u.keys.single == date));
  if (x.isEmpty) {
    return 0;
  } else {
    return x.single.values.single == 0 ? 0 : x.single.values.single;
  }
}

dynamic selectOtherData(HealthDataPoint data, String type) {
  return data.typeString == type ? double.parse(data.value.toString()) : null;
}

class AggregateData {
  double totalValue = 0;
  double totalWeight = 0;

  void addData(double value, double weight) {
    totalValue += value * weight;
    totalWeight += weight;
  }

  double getWeightedAverage() {
    return totalWeight == 0 ? 0 : totalValue / totalWeight;
  }
}

DateTime correctedDate(DateTime date, int originalOffset) {
  DateTime correctedDate =
      date.add(Duration(hours: originalOffset) - date.timeZoneOffset);
  correctedDate =
      DateTime.utc(correctedDate.year, correctedDate.month, correctedDate.day);
  correctedDate = correctedDate;

  return correctedDate;
}

List<HealthDataType> addDataTypes(List<String> dataTypes) {
  var types = <HealthDataType>[];
  if (dataTypes.contains("Steps")) {
    // Steps are treated separately below because Apple provides them in 15-minute intervals by default
  }

  if (dataTypes.contains("Workouts")) {
    types.add(HealthDataType.WORKOUT);
  }

  // VO2Max requires the Health package to be updated. Make sure that you follow
  // the steps above to do so
  if (dataTypes.contains("VO2 Max")) {
    types.add(HealthDataType.VO2MAX);
  }
  if (dataTypes.contains("Energy burned")) {
    // Energy is treated separately because Apple provides it in short intervals
  }
  if (dataTypes.contains("Heart rate")) {
    types.add(HealthDataType.RESTING_HEART_RATE);
    types.add(HealthDataType.WALKING_HEART_RATE);
  }
  if (dataTypes.contains("Sleep")) {
    // Sleep is treated separately because Apple provides it in short intervals
  }
  if (dataTypes.contains("Body composition")) {
    types.add(HealthDataType.BODY_FAT_PERCENTAGE);
    types.add(HealthDataType.BODY_MASS_INDEX);
    types.add(HealthDataType.HEIGHT);
    types.add(HealthDataType.WEIGHT);
    types.add(HealthDataType.WAIST_CIRCUMFERENCE);
  }
  if (dataTypes.contains("Pulse oximetry")) {
    types.add(HealthDataType.BLOOD_OXYGEN);
  }
  // Breathing rate is not currently available
  if (dataTypes.contains("Breathing rate")) {
    types.add(HealthDataType.RESPIRATORY_RATE);
  }
  if (dataTypes.contains("HRV")) {
    types.add(HealthDataType.HEART_RATE_VARIABILITY_SDNN);
  }
  if (dataTypes.contains("Blood pressure")) {
    types.add(HealthDataType.BLOOD_PRESSURE_SYSTOLIC);
    types.add(HealthDataType.BLOOD_PRESSURE_DIASTOLIC);
  }
  if (dataTypes.contains("Blood glucose")) {
    types.add(HealthDataType.BLOOD_GLUCOSE);
  }
  if (dataTypes.contains("Exposure")) {
//    types.add(HealthDataType.TIME_IN_DAYLIGHT);
//    types.add(HealthDataType.STANDING);
  }
  if (dataTypes.contains("Nutrition")) {
    types.add(HealthDataType.DIETARY_CARBS_CONSUMED);
    types.add(HealthDataType.DIETARY_CAFFEINE);
    types.add(HealthDataType.DIETARY_ENERGY_CONSUMED);
    types.add(HealthDataType.DIETARY_FATS_CONSUMED);
    types.add(HealthDataType.DIETARY_PROTEIN_CONSUMED);
    types.add(HealthDataType.NUTRITION);
  }
  if (dataTypes.contains("Vital signs")) {
    types.add(HealthDataType.BODY_TEMPERATURE);
    types.add(HealthDataType.MINDFULNESS);
    types.add(HealthDataType.AUDIOGRAM);
    // types.add(HealthDataType.BODY_WATER_MASS); // Google Health Connect only
    types.add(HealthDataType.FORCED_EXPIRATORY_VOLUME);
    types.add(HealthDataType.PERIPHERAL_PERFUSION_INDEX);
    types.add(HealthDataType.DISTANCE_WALKING_RUNNING);
    types.add(HealthDataType.DISTANCE_SWIMMING);
    types.add(HealthDataType.DISTANCE_CYCLING);
    types.add(HealthDataType.FLIGHTS_CLIMBED);
    // types.add(HealthDataType.MOVE_MINUTES); // Google Fit only
    // types.add(HealthDataType.DISTANCE_DELTA); // Google Fit and Google Health Connect only
    types.add(HealthDataType.WATER);
    types.add(HealthDataType.EXERCISE_TIME);
    types.add(HealthDataType.HEADACHE_NOT_PRESENT);
    types.add(HealthDataType.HEADACHE_MILD);
    types.add(HealthDataType.HEADACHE_MODERATE);
    types.add(HealthDataType.HEADACHE_SEVERE);
    types.add(HealthDataType.HEADACHE_UNSPECIFIED);
    types.add(HealthDataType.HIGH_HEART_RATE_EVENT);
    types.add(HealthDataType.LOW_HEART_RATE_EVENT);
    types.add(HealthDataType.IRREGULAR_HEART_RATE_EVENT);
  }
  if (dataTypes.contains("Mobility")) {
    // Needs to be added in the Health package first
  }
  return types;
}

checkIfTodayDataExists(List<CombinedDataStruct> data, int originalOffset,
    DocumentReference userRef) async {
  bool todayDataExists = false;
  // When done with the individual days, calculate the running total points for the given week
  if (data.isNotEmpty) {
    // If steps data exist for today, note it so that we can notify the user
    DateTime now = DateTime.now();
    DateTime todayMidnight = DateTime.utc(now.year, now.month, now.day)
        .add(Duration(hours: -originalOffset));
    data.sort((a, b) => a.eventDate!.compareTo(b.eventDate!));
    for (CombinedDataStruct x in data) {
      if (x.dataType == 'daily' && x.eventDate == todayMidnight) {
        todayDataExists = true;
      }
    }
    await userRef.update(createUsersRecordData(
      todayDataExists: todayDataExists,
    ));
  }
}

addPaData(CombinedDataStruct data, List<PaDataRecord> oldPaData,
    int originalOffset, DocumentReference userRef) async {
  // Check if the datapoint already exists in the database
  // If yes, delete it to prevent duplication
  int j = 0;
  var updateRef;
  bool uploadNew = true;
  while (j < oldPaData.length) {
    if (data.eventDate!.isAtSameMomentAs(oldPaData[j].eventDate!.toUtc()) &&
        (oldPaData[j].dataType == data.dataType) &&
        (oldPaData[j].workoutDuration == data.workoutDuration)) {
      // Store the reference of the datapoint to be updated
      updateRef = oldPaData[j].reference;
      uploadNew = false;
      j = oldPaData.length;
    }
    j++;
  }

  const Map<int, String> weekdayName = {
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun"
  };

  var paDataCreateData;

  if (data.dataType == 'daily') {
    paDataCreateData = createPaDataRecordData(
      createdAt: getCurrentTimestamp,
      eventDate: data.eventDate!,
      dataType: 'daily',
      sourceId: data.sourceId,
      sourceName: data.sourceName,
      platform: data.platform,
      steps: data.steps,
      energyTotal: data.energyTotal,
      energyActive: data.energyActive,
      energyResting: data.energyResting,
      heartRateResting:
          data.heartRateResting == 0 ? null : data.heartRateResting,
      activityLight: data.activityLight == 0 ? null : data.activityLight,
      activityModerate:
          data.activityModerate == 0 ? null : data.activityModerate,
      activityVigorous:
          data.activityVigorous == 0 ? null : data.activityVigorous,
      sleepTotal: data.sleepTotal == 0 ? null : data.sleepTotal,
      sleepAwake: data.sleepAwake == 0 ? null : data.sleepAwake,
      sleepDeep: data.sleepDeep == 0 ? null : data.sleepDeep,
      sleepRem: data.sleepRem == 0 ? null : data.sleepRem,
      sleepLight: data.sleepLight == 0 ? null : data.sleepLight,
      sleepEnd: data.sleepEnd == 0 ? null : data.sleepEnd,
      sleepStart: data.sleepStart == 0 ? null : data.sleepStart,
      bmi: data.bmi == 0 ? null : data.bmi,
      waist: data.waist == 0 ? null : data.waist,
      bodyFat: data.bodyFat == 0 ? null : data.bodyFat,
      muscleMass:
          data.muscleMass.toDouble() == 0 ? null : data.muscleMass.toDouble(),
      vo2Max: data.vo2Max == 0 ? null : data.vo2Max,
      height: data.height == 0 ? null : data.height,
      weight: data.weight == 0 ? null : data.weight,
      // fitnessAge: data.fitnessAge,
      spo2Avg: data.spo2Avg == 0 ? null : data.spo2Avg,
      spo2Max: data.spo2Max == 0 ? null : data.spo2Max,
      spo2Min: data.spo2Min == 0 ? null : data.spo2Min,
      hrvDaily: data.hrvDaily == 0 ? null : data.hrvDaily,
      hrvDeep: data.hrvDeep == 0 ? null : data.hrvDeep,
      hrvUnit: data.hrvUnit == '' ? null : data.hrvUnit,
      breathingRate: data.breathingRate == 0 ? null : data.breathingRate,
      // smoking: data.smoking,
      bpSystolic: data.bpSystolic == 0 ? null : data.bpSystolic,
      bpDiastolic: data.bpDiastolic == 0 ? null : data.bpDiastolic,
      glucoseRandom: data.glucoseRandom == 0 ? null : data.glucoseRandom,
      glucoseHbA1c: data.glucoseHbA1c == 0 ? null : data.glucoseHbA1c,
      standHours: data.standHours == 0 ? null : data.standHours,
      // standingMinutes: data.standingMinutes == 0 ? null : data.standingMinutes,
      weekday: weekdayName[data.eventDate!.weekday],
      weekdayNo: data.eventDate!.weekday,
    );
  } else if (data.dataType == 'workout') {
    paDataCreateData = createPaDataRecordData(
      createdAt: getCurrentTimestamp,
      eventDate: data.eventDate!,
      dataType: 'workout',
      sourceId: data.sourceId,
      sourceName: data.sourceName,
      platform: data.platform,
      workoutDuration: data.workoutDuration,
      workoutDistance: data.workoutDistance,
      workoutCalories: data.workoutCalories,
      // workoutHeartRateAverage: data.workoutHeartRateAverage,
      // workoutHeartRateMax: data.workoutHeartRateMax,
      // workoutHeartRateRelative: data.workoutHeartRateRelative,
      workoutManualEntry: data.workoutManualEntry,
      workoutType: data.workoutType,
      weekday: weekdayName[data.eventDate!.weekday],
      weekdayNo: data.eventDate!.weekday,
    );
  } else {
    paDataCreateData = createPaDataRecordData(
      createdAt: getCurrentTimestamp,
      eventDate: data.eventDate!,
      dataType: 'reading',
      sourceId: data.sourceId,
      sourceName: data.sourceName,
      platform: data.platform,
      height: data.height,
      weight: data.weight,
      bmi: data.bmi,
      waist: data.waist,
      bodyFat: data.bodyFat,
      muscleMass: data.muscleMass.toDouble(),
      vo2Max: data.vo2Max,
      // fitnessAge: data.fitnessAge,
      spo2Avg: data.spo2Avg,
      spo2Max: data.spo2Max,
      spo2Min: data.spo2Min,
      hrvDaily: data.hrvDaily,
      hrvDeep: data.hrvDeep,
      hrvUnit: data.hrvUnit,
      breathingRate: data.breathingRate,
      // smoking: data.smoking,
      bpSystolic: data.bpSystolic,
      bpDiastolic: data.bpDiastolic,
      glucoseRandom: data.glucoseRandom,
      glucoseHbA1c: data.glucoseHbA1c,
      weekday: weekdayName[data.eventDate!.weekday],
      weekdayNo: data.eventDate!.weekday,
    );
  }

  if (uploadNew == true) {
    await PaDataRecord.createDoc(userRef).set(paDataCreateData);
  } else {
    await updateRef.update(paDataCreateData);
  }
}
