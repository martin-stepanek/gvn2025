// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CombinedDataStruct extends FFFirebaseStruct {
  CombinedDataStruct({
    DocumentReference? user,
    DateTime? createdAt,
    DateTime? eventDate,
    String? dataType,
    String? sourceId,
    String? sourceName,
    String? platform,
    int? steps,
    int? energyTotal,
    int? energyActive,
    int? heartRateResting,
    int? activityLight,
    int? activityModerate,
    int? activityVigorous,
    int? sleepTotal,
    int? sleepDeep,
    int? sleepRem,
    int? sleepLight,
    int? sleepAwake,
    DateTime? sleepStart,
    DateTime? sleepEnd,
    double? height,
    double? weight,
    double? bmi,
    double? waist,
    double? bodyFat,
    double? vo2Max,
    double? hrvDaily,
    double? hrvDeep,
    bool? smoking,
    int? bpSystolic,
    int? bpDiastolic,
    double? glucoseRandom,
    double? glucoseHbA1c,
    double? workoutDistance,
    String? workoutType,
    int? workoutCalories,
    bool? workoutManualEntry,
    int? energyResting,
    String? hrvUnit,
    double? spo2Avg,
    double? spo2Min,
    double? spo2Max,
    double? breathingRate,
    double? muscleMass,
    double? fitnessAge,
    double? timeInDaylight,
    double? workoutHeartRateRelative,
    double? workoutHeartRateAverage,
    double? workoutHeartRateMax,
    double? workoutDuration,
    double? standingMinutes,
    double? standHours,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _createdAt = createdAt,
        _eventDate = eventDate,
        _dataType = dataType,
        _sourceId = sourceId,
        _sourceName = sourceName,
        _platform = platform,
        _steps = steps,
        _energyTotal = energyTotal,
        _energyActive = energyActive,
        _heartRateResting = heartRateResting,
        _activityLight = activityLight,
        _activityModerate = activityModerate,
        _activityVigorous = activityVigorous,
        _sleepTotal = sleepTotal,
        _sleepDeep = sleepDeep,
        _sleepRem = sleepRem,
        _sleepLight = sleepLight,
        _sleepAwake = sleepAwake,
        _sleepStart = sleepStart,
        _sleepEnd = sleepEnd,
        _height = height,
        _weight = weight,
        _bmi = bmi,
        _waist = waist,
        _bodyFat = bodyFat,
        _vo2Max = vo2Max,
        _hrvDaily = hrvDaily,
        _hrvDeep = hrvDeep,
        _smoking = smoking,
        _bpSystolic = bpSystolic,
        _bpDiastolic = bpDiastolic,
        _glucoseRandom = glucoseRandom,
        _glucoseHbA1c = glucoseHbA1c,
        _workoutDistance = workoutDistance,
        _workoutType = workoutType,
        _workoutCalories = workoutCalories,
        _workoutManualEntry = workoutManualEntry,
        _energyResting = energyResting,
        _hrvUnit = hrvUnit,
        _spo2Avg = spo2Avg,
        _spo2Min = spo2Min,
        _spo2Max = spo2Max,
        _breathingRate = breathingRate,
        _muscleMass = muscleMass,
        _fitnessAge = fitnessAge,
        _timeInDaylight = timeInDaylight,
        _workoutHeartRateRelative = workoutHeartRateRelative,
        _workoutHeartRateAverage = workoutHeartRateAverage,
        _workoutHeartRateMax = workoutHeartRateMax,
        _workoutDuration = workoutDuration,
        _standingMinutes = standingMinutes,
        _standHours = standHours,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  set eventDate(DateTime? val) => _eventDate = val;

  bool hasEventDate() => _eventDate != null;

  // "data_type" field.
  String? _dataType;
  String get dataType => _dataType ?? '';
  set dataType(String? val) => _dataType = val;

  bool hasDataType() => _dataType != null;

  // "source_id" field.
  String? _sourceId;
  String get sourceId => _sourceId ?? '';
  set sourceId(String? val) => _sourceId = val;

  bool hasSourceId() => _sourceId != null;

  // "source_name" field.
  String? _sourceName;
  String get sourceName => _sourceName ?? '';
  set sourceName(String? val) => _sourceName = val;

  bool hasSourceName() => _sourceName != null;

  // "platform" field.
  String? _platform;
  String get platform => _platform ?? '';
  set platform(String? val) => _platform = val;

  bool hasPlatform() => _platform != null;

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  set steps(int? val) => _steps = val;

  void incrementSteps(int amount) => steps = steps + amount;

  bool hasSteps() => _steps != null;

  // "energy_total" field.
  int? _energyTotal;
  int get energyTotal => _energyTotal ?? 0;
  set energyTotal(int? val) => _energyTotal = val;

  void incrementEnergyTotal(int amount) => energyTotal = energyTotal + amount;

  bool hasEnergyTotal() => _energyTotal != null;

  // "energy_active" field.
  int? _energyActive;
  int get energyActive => _energyActive ?? 0;
  set energyActive(int? val) => _energyActive = val;

  void incrementEnergyActive(int amount) =>
      energyActive = energyActive + amount;

  bool hasEnergyActive() => _energyActive != null;

  // "heart_rate_resting" field.
  int? _heartRateResting;
  int get heartRateResting => _heartRateResting ?? 0;
  set heartRateResting(int? val) => _heartRateResting = val;

  void incrementHeartRateResting(int amount) =>
      heartRateResting = heartRateResting + amount;

  bool hasHeartRateResting() => _heartRateResting != null;

  // "activity_light" field.
  int? _activityLight;
  int get activityLight => _activityLight ?? 0;
  set activityLight(int? val) => _activityLight = val;

  void incrementActivityLight(int amount) =>
      activityLight = activityLight + amount;

  bool hasActivityLight() => _activityLight != null;

  // "activity_moderate" field.
  int? _activityModerate;
  int get activityModerate => _activityModerate ?? 0;
  set activityModerate(int? val) => _activityModerate = val;

  void incrementActivityModerate(int amount) =>
      activityModerate = activityModerate + amount;

  bool hasActivityModerate() => _activityModerate != null;

  // "activity_vigorous" field.
  int? _activityVigorous;
  int get activityVigorous => _activityVigorous ?? 0;
  set activityVigorous(int? val) => _activityVigorous = val;

  void incrementActivityVigorous(int amount) =>
      activityVigorous = activityVigorous + amount;

  bool hasActivityVigorous() => _activityVigorous != null;

  // "sleep_total" field.
  int? _sleepTotal;
  int get sleepTotal => _sleepTotal ?? 0;
  set sleepTotal(int? val) => _sleepTotal = val;

  void incrementSleepTotal(int amount) => sleepTotal = sleepTotal + amount;

  bool hasSleepTotal() => _sleepTotal != null;

  // "sleep_deep" field.
  int? _sleepDeep;
  int get sleepDeep => _sleepDeep ?? 0;
  set sleepDeep(int? val) => _sleepDeep = val;

  void incrementSleepDeep(int amount) => sleepDeep = sleepDeep + amount;

  bool hasSleepDeep() => _sleepDeep != null;

  // "sleep_rem" field.
  int? _sleepRem;
  int get sleepRem => _sleepRem ?? 0;
  set sleepRem(int? val) => _sleepRem = val;

  void incrementSleepRem(int amount) => sleepRem = sleepRem + amount;

  bool hasSleepRem() => _sleepRem != null;

  // "sleep_light" field.
  int? _sleepLight;
  int get sleepLight => _sleepLight ?? 0;
  set sleepLight(int? val) => _sleepLight = val;

  void incrementSleepLight(int amount) => sleepLight = sleepLight + amount;

  bool hasSleepLight() => _sleepLight != null;

  // "sleep_awake" field.
  int? _sleepAwake;
  int get sleepAwake => _sleepAwake ?? 0;
  set sleepAwake(int? val) => _sleepAwake = val;

  void incrementSleepAwake(int amount) => sleepAwake = sleepAwake + amount;

  bool hasSleepAwake() => _sleepAwake != null;

  // "sleep_start" field.
  DateTime? _sleepStart;
  DateTime? get sleepStart => _sleepStart;
  set sleepStart(DateTime? val) => _sleepStart = val;

  bool hasSleepStart() => _sleepStart != null;

  // "sleep_end" field.
  DateTime? _sleepEnd;
  DateTime? get sleepEnd => _sleepEnd;
  set sleepEnd(DateTime? val) => _sleepEnd = val;

  bool hasSleepEnd() => _sleepEnd != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "bmi" field.
  double? _bmi;
  double get bmi => _bmi ?? 0.0;
  set bmi(double? val) => _bmi = val;

  void incrementBmi(double amount) => bmi = bmi + amount;

  bool hasBmi() => _bmi != null;

  // "waist" field.
  double? _waist;
  double get waist => _waist ?? 0.0;
  set waist(double? val) => _waist = val;

  void incrementWaist(double amount) => waist = waist + amount;

  bool hasWaist() => _waist != null;

  // "body_fat" field.
  double? _bodyFat;
  double get bodyFat => _bodyFat ?? 0.0;
  set bodyFat(double? val) => _bodyFat = val;

  void incrementBodyFat(double amount) => bodyFat = bodyFat + amount;

  bool hasBodyFat() => _bodyFat != null;

  // "vo2_max" field.
  double? _vo2Max;
  double get vo2Max => _vo2Max ?? 0.0;
  set vo2Max(double? val) => _vo2Max = val;

  void incrementVo2Max(double amount) => vo2Max = vo2Max + amount;

  bool hasVo2Max() => _vo2Max != null;

  // "hrv_daily" field.
  double? _hrvDaily;
  double get hrvDaily => _hrvDaily ?? 0.0;
  set hrvDaily(double? val) => _hrvDaily = val;

  void incrementHrvDaily(double amount) => hrvDaily = hrvDaily + amount;

  bool hasHrvDaily() => _hrvDaily != null;

  // "hrv_deep" field.
  double? _hrvDeep;
  double get hrvDeep => _hrvDeep ?? 0.0;
  set hrvDeep(double? val) => _hrvDeep = val;

  void incrementHrvDeep(double amount) => hrvDeep = hrvDeep + amount;

  bool hasHrvDeep() => _hrvDeep != null;

  // "smoking" field.
  bool? _smoking;
  bool get smoking => _smoking ?? false;
  set smoking(bool? val) => _smoking = val;

  bool hasSmoking() => _smoking != null;

  // "bp_systolic" field.
  int? _bpSystolic;
  int get bpSystolic => _bpSystolic ?? 0;
  set bpSystolic(int? val) => _bpSystolic = val;

  void incrementBpSystolic(int amount) => bpSystolic = bpSystolic + amount;

  bool hasBpSystolic() => _bpSystolic != null;

  // "bp_diastolic" field.
  int? _bpDiastolic;
  int get bpDiastolic => _bpDiastolic ?? 0;
  set bpDiastolic(int? val) => _bpDiastolic = val;

  void incrementBpDiastolic(int amount) => bpDiastolic = bpDiastolic + amount;

  bool hasBpDiastolic() => _bpDiastolic != null;

  // "glucose_random" field.
  double? _glucoseRandom;
  double get glucoseRandom => _glucoseRandom ?? 0.0;
  set glucoseRandom(double? val) => _glucoseRandom = val;

  void incrementGlucoseRandom(double amount) =>
      glucoseRandom = glucoseRandom + amount;

  bool hasGlucoseRandom() => _glucoseRandom != null;

  // "glucose_HbA1c" field.
  double? _glucoseHbA1c;
  double get glucoseHbA1c => _glucoseHbA1c ?? 0.0;
  set glucoseHbA1c(double? val) => _glucoseHbA1c = val;

  void incrementGlucoseHbA1c(double amount) =>
      glucoseHbA1c = glucoseHbA1c + amount;

  bool hasGlucoseHbA1c() => _glucoseHbA1c != null;

  // "workout_distance" field.
  double? _workoutDistance;
  double get workoutDistance => _workoutDistance ?? 0.0;
  set workoutDistance(double? val) => _workoutDistance = val;

  void incrementWorkoutDistance(double amount) =>
      workoutDistance = workoutDistance + amount;

  bool hasWorkoutDistance() => _workoutDistance != null;

  // "workout_type" field.
  String? _workoutType;
  String get workoutType => _workoutType ?? '';
  set workoutType(String? val) => _workoutType = val;

  bool hasWorkoutType() => _workoutType != null;

  // "workout_calories" field.
  int? _workoutCalories;
  int get workoutCalories => _workoutCalories ?? 0;
  set workoutCalories(int? val) => _workoutCalories = val;

  void incrementWorkoutCalories(int amount) =>
      workoutCalories = workoutCalories + amount;

  bool hasWorkoutCalories() => _workoutCalories != null;

  // "workout_manual_entry" field.
  bool? _workoutManualEntry;
  bool get workoutManualEntry => _workoutManualEntry ?? false;
  set workoutManualEntry(bool? val) => _workoutManualEntry = val;

  bool hasWorkoutManualEntry() => _workoutManualEntry != null;

  // "energy_resting" field.
  int? _energyResting;
  int get energyResting => _energyResting ?? 0;
  set energyResting(int? val) => _energyResting = val;

  void incrementEnergyResting(int amount) =>
      energyResting = energyResting + amount;

  bool hasEnergyResting() => _energyResting != null;

  // "hrv_unit" field.
  String? _hrvUnit;
  String get hrvUnit => _hrvUnit ?? '';
  set hrvUnit(String? val) => _hrvUnit = val;

  bool hasHrvUnit() => _hrvUnit != null;

  // "spo2_avg" field.
  double? _spo2Avg;
  double get spo2Avg => _spo2Avg ?? 0.0;
  set spo2Avg(double? val) => _spo2Avg = val;

  void incrementSpo2Avg(double amount) => spo2Avg = spo2Avg + amount;

  bool hasSpo2Avg() => _spo2Avg != null;

  // "spo2_min" field.
  double? _spo2Min;
  double get spo2Min => _spo2Min ?? 0.0;
  set spo2Min(double? val) => _spo2Min = val;

  void incrementSpo2Min(double amount) => spo2Min = spo2Min + amount;

  bool hasSpo2Min() => _spo2Min != null;

  // "spo2_max" field.
  double? _spo2Max;
  double get spo2Max => _spo2Max ?? 0.0;
  set spo2Max(double? val) => _spo2Max = val;

  void incrementSpo2Max(double amount) => spo2Max = spo2Max + amount;

  bool hasSpo2Max() => _spo2Max != null;

  // "breathing_rate" field.
  double? _breathingRate;
  double get breathingRate => _breathingRate ?? 0.0;
  set breathingRate(double? val) => _breathingRate = val;

  void incrementBreathingRate(double amount) =>
      breathingRate = breathingRate + amount;

  bool hasBreathingRate() => _breathingRate != null;

  // "muscle_mass" field.
  double? _muscleMass;
  double get muscleMass => _muscleMass ?? 0.0;
  set muscleMass(double? val) => _muscleMass = val;

  void incrementMuscleMass(double amount) => muscleMass = muscleMass + amount;

  bool hasMuscleMass() => _muscleMass != null;

  // "fitness_age" field.
  double? _fitnessAge;
  double get fitnessAge => _fitnessAge ?? 0.0;
  set fitnessAge(double? val) => _fitnessAge = val;

  void incrementFitnessAge(double amount) => fitnessAge = fitnessAge + amount;

  bool hasFitnessAge() => _fitnessAge != null;

  // "time_in_daylight" field.
  double? _timeInDaylight;
  double get timeInDaylight => _timeInDaylight ?? 0.0;
  set timeInDaylight(double? val) => _timeInDaylight = val;

  void incrementTimeInDaylight(double amount) =>
      timeInDaylight = timeInDaylight + amount;

  bool hasTimeInDaylight() => _timeInDaylight != null;

  // "workout_heart_rate_relative" field.
  double? _workoutHeartRateRelative;
  double get workoutHeartRateRelative => _workoutHeartRateRelative ?? 0.0;
  set workoutHeartRateRelative(double? val) => _workoutHeartRateRelative = val;

  void incrementWorkoutHeartRateRelative(double amount) =>
      workoutHeartRateRelative = workoutHeartRateRelative + amount;

  bool hasWorkoutHeartRateRelative() => _workoutHeartRateRelative != null;

  // "workout_heart_rate_average" field.
  double? _workoutHeartRateAverage;
  double get workoutHeartRateAverage => _workoutHeartRateAverage ?? 0.0;
  set workoutHeartRateAverage(double? val) => _workoutHeartRateAverage = val;

  void incrementWorkoutHeartRateAverage(double amount) =>
      workoutHeartRateAverage = workoutHeartRateAverage + amount;

  bool hasWorkoutHeartRateAverage() => _workoutHeartRateAverage != null;

  // "workout_heart_rate_max" field.
  double? _workoutHeartRateMax;
  double get workoutHeartRateMax => _workoutHeartRateMax ?? 0.0;
  set workoutHeartRateMax(double? val) => _workoutHeartRateMax = val;

  void incrementWorkoutHeartRateMax(double amount) =>
      workoutHeartRateMax = workoutHeartRateMax + amount;

  bool hasWorkoutHeartRateMax() => _workoutHeartRateMax != null;

  // "workout_duration" field.
  double? _workoutDuration;
  double get workoutDuration => _workoutDuration ?? 0.0;
  set workoutDuration(double? val) => _workoutDuration = val;

  void incrementWorkoutDuration(double amount) =>
      workoutDuration = workoutDuration + amount;

  bool hasWorkoutDuration() => _workoutDuration != null;

  // "standing_minutes" field.
  double? _standingMinutes;
  double get standingMinutes => _standingMinutes ?? 0.0;
  set standingMinutes(double? val) => _standingMinutes = val;

  void incrementStandingMinutes(double amount) =>
      standingMinutes = standingMinutes + amount;

  bool hasStandingMinutes() => _standingMinutes != null;

  // "stand_hours" field.
  double? _standHours;
  double get standHours => _standHours ?? 0.0;
  set standHours(double? val) => _standHours = val;

  void incrementStandHours(double amount) => standHours = standHours + amount;

  bool hasStandHours() => _standHours != null;

  static CombinedDataStruct fromMap(Map<String, dynamic> data) =>
      CombinedDataStruct(
        user: data['user'] as DocumentReference?,
        createdAt: data['created_at'] as DateTime?,
        eventDate: data['event_date'] as DateTime?,
        dataType: data['data_type'] as String?,
        sourceId: data['source_id'] as String?,
        sourceName: data['source_name'] as String?,
        platform: data['platform'] as String?,
        steps: castToType<int>(data['steps']),
        energyTotal: castToType<int>(data['energy_total']),
        energyActive: castToType<int>(data['energy_active']),
        heartRateResting: castToType<int>(data['heart_rate_resting']),
        activityLight: castToType<int>(data['activity_light']),
        activityModerate: castToType<int>(data['activity_moderate']),
        activityVigorous: castToType<int>(data['activity_vigorous']),
        sleepTotal: castToType<int>(data['sleep_total']),
        sleepDeep: castToType<int>(data['sleep_deep']),
        sleepRem: castToType<int>(data['sleep_rem']),
        sleepLight: castToType<int>(data['sleep_light']),
        sleepAwake: castToType<int>(data['sleep_awake']),
        sleepStart: data['sleep_start'] as DateTime?,
        sleepEnd: data['sleep_end'] as DateTime?,
        height: castToType<double>(data['height']),
        weight: castToType<double>(data['weight']),
        bmi: castToType<double>(data['bmi']),
        waist: castToType<double>(data['waist']),
        bodyFat: castToType<double>(data['body_fat']),
        vo2Max: castToType<double>(data['vo2_max']),
        hrvDaily: castToType<double>(data['hrv_daily']),
        hrvDeep: castToType<double>(data['hrv_deep']),
        smoking: data['smoking'] as bool?,
        bpSystolic: castToType<int>(data['bp_systolic']),
        bpDiastolic: castToType<int>(data['bp_diastolic']),
        glucoseRandom: castToType<double>(data['glucose_random']),
        glucoseHbA1c: castToType<double>(data['glucose_HbA1c']),
        workoutDistance: castToType<double>(data['workout_distance']),
        workoutType: data['workout_type'] as String?,
        workoutCalories: castToType<int>(data['workout_calories']),
        workoutManualEntry: data['workout_manual_entry'] as bool?,
        energyResting: castToType<int>(data['energy_resting']),
        hrvUnit: data['hrv_unit'] as String?,
        spo2Avg: castToType<double>(data['spo2_avg']),
        spo2Min: castToType<double>(data['spo2_min']),
        spo2Max: castToType<double>(data['spo2_max']),
        breathingRate: castToType<double>(data['breathing_rate']),
        muscleMass: castToType<double>(data['muscle_mass']),
        fitnessAge: castToType<double>(data['fitness_age']),
        timeInDaylight: castToType<double>(data['time_in_daylight']),
        workoutHeartRateRelative:
            castToType<double>(data['workout_heart_rate_relative']),
        workoutHeartRateAverage:
            castToType<double>(data['workout_heart_rate_average']),
        workoutHeartRateMax: castToType<double>(data['workout_heart_rate_max']),
        workoutDuration: castToType<double>(data['workout_duration']),
        standingMinutes: castToType<double>(data['standing_minutes']),
        standHours: castToType<double>(data['stand_hours']),
      );

  static CombinedDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CombinedDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'created_at': _createdAt,
        'event_date': _eventDate,
        'data_type': _dataType,
        'source_id': _sourceId,
        'source_name': _sourceName,
        'platform': _platform,
        'steps': _steps,
        'energy_total': _energyTotal,
        'energy_active': _energyActive,
        'heart_rate_resting': _heartRateResting,
        'activity_light': _activityLight,
        'activity_moderate': _activityModerate,
        'activity_vigorous': _activityVigorous,
        'sleep_total': _sleepTotal,
        'sleep_deep': _sleepDeep,
        'sleep_rem': _sleepRem,
        'sleep_light': _sleepLight,
        'sleep_awake': _sleepAwake,
        'sleep_start': _sleepStart,
        'sleep_end': _sleepEnd,
        'height': _height,
        'weight': _weight,
        'bmi': _bmi,
        'waist': _waist,
        'body_fat': _bodyFat,
        'vo2_max': _vo2Max,
        'hrv_daily': _hrvDaily,
        'hrv_deep': _hrvDeep,
        'smoking': _smoking,
        'bp_systolic': _bpSystolic,
        'bp_diastolic': _bpDiastolic,
        'glucose_random': _glucoseRandom,
        'glucose_HbA1c': _glucoseHbA1c,
        'workout_distance': _workoutDistance,
        'workout_type': _workoutType,
        'workout_calories': _workoutCalories,
        'workout_manual_entry': _workoutManualEntry,
        'energy_resting': _energyResting,
        'hrv_unit': _hrvUnit,
        'spo2_avg': _spo2Avg,
        'spo2_min': _spo2Min,
        'spo2_max': _spo2Max,
        'breathing_rate': _breathingRate,
        'muscle_mass': _muscleMass,
        'fitness_age': _fitnessAge,
        'time_in_daylight': _timeInDaylight,
        'workout_heart_rate_relative': _workoutHeartRateRelative,
        'workout_heart_rate_average': _workoutHeartRateAverage,
        'workout_heart_rate_max': _workoutHeartRateMax,
        'workout_duration': _workoutDuration,
        'standing_minutes': _standingMinutes,
        'stand_hours': _standHours,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'event_date': serializeParam(
          _eventDate,
          ParamType.DateTime,
        ),
        'data_type': serializeParam(
          _dataType,
          ParamType.String,
        ),
        'source_id': serializeParam(
          _sourceId,
          ParamType.String,
        ),
        'source_name': serializeParam(
          _sourceName,
          ParamType.String,
        ),
        'platform': serializeParam(
          _platform,
          ParamType.String,
        ),
        'steps': serializeParam(
          _steps,
          ParamType.int,
        ),
        'energy_total': serializeParam(
          _energyTotal,
          ParamType.int,
        ),
        'energy_active': serializeParam(
          _energyActive,
          ParamType.int,
        ),
        'heart_rate_resting': serializeParam(
          _heartRateResting,
          ParamType.int,
        ),
        'activity_light': serializeParam(
          _activityLight,
          ParamType.int,
        ),
        'activity_moderate': serializeParam(
          _activityModerate,
          ParamType.int,
        ),
        'activity_vigorous': serializeParam(
          _activityVigorous,
          ParamType.int,
        ),
        'sleep_total': serializeParam(
          _sleepTotal,
          ParamType.int,
        ),
        'sleep_deep': serializeParam(
          _sleepDeep,
          ParamType.int,
        ),
        'sleep_rem': serializeParam(
          _sleepRem,
          ParamType.int,
        ),
        'sleep_light': serializeParam(
          _sleepLight,
          ParamType.int,
        ),
        'sleep_awake': serializeParam(
          _sleepAwake,
          ParamType.int,
        ),
        'sleep_start': serializeParam(
          _sleepStart,
          ParamType.DateTime,
        ),
        'sleep_end': serializeParam(
          _sleepEnd,
          ParamType.DateTime,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'bmi': serializeParam(
          _bmi,
          ParamType.double,
        ),
        'waist': serializeParam(
          _waist,
          ParamType.double,
        ),
        'body_fat': serializeParam(
          _bodyFat,
          ParamType.double,
        ),
        'vo2_max': serializeParam(
          _vo2Max,
          ParamType.double,
        ),
        'hrv_daily': serializeParam(
          _hrvDaily,
          ParamType.double,
        ),
        'hrv_deep': serializeParam(
          _hrvDeep,
          ParamType.double,
        ),
        'smoking': serializeParam(
          _smoking,
          ParamType.bool,
        ),
        'bp_systolic': serializeParam(
          _bpSystolic,
          ParamType.int,
        ),
        'bp_diastolic': serializeParam(
          _bpDiastolic,
          ParamType.int,
        ),
        'glucose_random': serializeParam(
          _glucoseRandom,
          ParamType.double,
        ),
        'glucose_HbA1c': serializeParam(
          _glucoseHbA1c,
          ParamType.double,
        ),
        'workout_distance': serializeParam(
          _workoutDistance,
          ParamType.double,
        ),
        'workout_type': serializeParam(
          _workoutType,
          ParamType.String,
        ),
        'workout_calories': serializeParam(
          _workoutCalories,
          ParamType.int,
        ),
        'workout_manual_entry': serializeParam(
          _workoutManualEntry,
          ParamType.bool,
        ),
        'energy_resting': serializeParam(
          _energyResting,
          ParamType.int,
        ),
        'hrv_unit': serializeParam(
          _hrvUnit,
          ParamType.String,
        ),
        'spo2_avg': serializeParam(
          _spo2Avg,
          ParamType.double,
        ),
        'spo2_min': serializeParam(
          _spo2Min,
          ParamType.double,
        ),
        'spo2_max': serializeParam(
          _spo2Max,
          ParamType.double,
        ),
        'breathing_rate': serializeParam(
          _breathingRate,
          ParamType.double,
        ),
        'muscle_mass': serializeParam(
          _muscleMass,
          ParamType.double,
        ),
        'fitness_age': serializeParam(
          _fitnessAge,
          ParamType.double,
        ),
        'time_in_daylight': serializeParam(
          _timeInDaylight,
          ParamType.double,
        ),
        'workout_heart_rate_relative': serializeParam(
          _workoutHeartRateRelative,
          ParamType.double,
        ),
        'workout_heart_rate_average': serializeParam(
          _workoutHeartRateAverage,
          ParamType.double,
        ),
        'workout_heart_rate_max': serializeParam(
          _workoutHeartRateMax,
          ParamType.double,
        ),
        'workout_duration': serializeParam(
          _workoutDuration,
          ParamType.double,
        ),
        'standing_minutes': serializeParam(
          _standingMinutes,
          ParamType.double,
        ),
        'stand_hours': serializeParam(
          _standHours,
          ParamType.double,
        ),
      }.withoutNulls;

  static CombinedDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CombinedDataStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        eventDate: deserializeParam(
          data['event_date'],
          ParamType.DateTime,
          false,
        ),
        dataType: deserializeParam(
          data['data_type'],
          ParamType.String,
          false,
        ),
        sourceId: deserializeParam(
          data['source_id'],
          ParamType.String,
          false,
        ),
        sourceName: deserializeParam(
          data['source_name'],
          ParamType.String,
          false,
        ),
        platform: deserializeParam(
          data['platform'],
          ParamType.String,
          false,
        ),
        steps: deserializeParam(
          data['steps'],
          ParamType.int,
          false,
        ),
        energyTotal: deserializeParam(
          data['energy_total'],
          ParamType.int,
          false,
        ),
        energyActive: deserializeParam(
          data['energy_active'],
          ParamType.int,
          false,
        ),
        heartRateResting: deserializeParam(
          data['heart_rate_resting'],
          ParamType.int,
          false,
        ),
        activityLight: deserializeParam(
          data['activity_light'],
          ParamType.int,
          false,
        ),
        activityModerate: deserializeParam(
          data['activity_moderate'],
          ParamType.int,
          false,
        ),
        activityVigorous: deserializeParam(
          data['activity_vigorous'],
          ParamType.int,
          false,
        ),
        sleepTotal: deserializeParam(
          data['sleep_total'],
          ParamType.int,
          false,
        ),
        sleepDeep: deserializeParam(
          data['sleep_deep'],
          ParamType.int,
          false,
        ),
        sleepRem: deserializeParam(
          data['sleep_rem'],
          ParamType.int,
          false,
        ),
        sleepLight: deserializeParam(
          data['sleep_light'],
          ParamType.int,
          false,
        ),
        sleepAwake: deserializeParam(
          data['sleep_awake'],
          ParamType.int,
          false,
        ),
        sleepStart: deserializeParam(
          data['sleep_start'],
          ParamType.DateTime,
          false,
        ),
        sleepEnd: deserializeParam(
          data['sleep_end'],
          ParamType.DateTime,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        bmi: deserializeParam(
          data['bmi'],
          ParamType.double,
          false,
        ),
        waist: deserializeParam(
          data['waist'],
          ParamType.double,
          false,
        ),
        bodyFat: deserializeParam(
          data['body_fat'],
          ParamType.double,
          false,
        ),
        vo2Max: deserializeParam(
          data['vo2_max'],
          ParamType.double,
          false,
        ),
        hrvDaily: deserializeParam(
          data['hrv_daily'],
          ParamType.double,
          false,
        ),
        hrvDeep: deserializeParam(
          data['hrv_deep'],
          ParamType.double,
          false,
        ),
        smoking: deserializeParam(
          data['smoking'],
          ParamType.bool,
          false,
        ),
        bpSystolic: deserializeParam(
          data['bp_systolic'],
          ParamType.int,
          false,
        ),
        bpDiastolic: deserializeParam(
          data['bp_diastolic'],
          ParamType.int,
          false,
        ),
        glucoseRandom: deserializeParam(
          data['glucose_random'],
          ParamType.double,
          false,
        ),
        glucoseHbA1c: deserializeParam(
          data['glucose_HbA1c'],
          ParamType.double,
          false,
        ),
        workoutDistance: deserializeParam(
          data['workout_distance'],
          ParamType.double,
          false,
        ),
        workoutType: deserializeParam(
          data['workout_type'],
          ParamType.String,
          false,
        ),
        workoutCalories: deserializeParam(
          data['workout_calories'],
          ParamType.int,
          false,
        ),
        workoutManualEntry: deserializeParam(
          data['workout_manual_entry'],
          ParamType.bool,
          false,
        ),
        energyResting: deserializeParam(
          data['energy_resting'],
          ParamType.int,
          false,
        ),
        hrvUnit: deserializeParam(
          data['hrv_unit'],
          ParamType.String,
          false,
        ),
        spo2Avg: deserializeParam(
          data['spo2_avg'],
          ParamType.double,
          false,
        ),
        spo2Min: deserializeParam(
          data['spo2_min'],
          ParamType.double,
          false,
        ),
        spo2Max: deserializeParam(
          data['spo2_max'],
          ParamType.double,
          false,
        ),
        breathingRate: deserializeParam(
          data['breathing_rate'],
          ParamType.double,
          false,
        ),
        muscleMass: deserializeParam(
          data['muscle_mass'],
          ParamType.double,
          false,
        ),
        fitnessAge: deserializeParam(
          data['fitness_age'],
          ParamType.double,
          false,
        ),
        timeInDaylight: deserializeParam(
          data['time_in_daylight'],
          ParamType.double,
          false,
        ),
        workoutHeartRateRelative: deserializeParam(
          data['workout_heart_rate_relative'],
          ParamType.double,
          false,
        ),
        workoutHeartRateAverage: deserializeParam(
          data['workout_heart_rate_average'],
          ParamType.double,
          false,
        ),
        workoutHeartRateMax: deserializeParam(
          data['workout_heart_rate_max'],
          ParamType.double,
          false,
        ),
        workoutDuration: deserializeParam(
          data['workout_duration'],
          ParamType.double,
          false,
        ),
        standingMinutes: deserializeParam(
          data['standing_minutes'],
          ParamType.double,
          false,
        ),
        standHours: deserializeParam(
          data['stand_hours'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CombinedDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CombinedDataStruct &&
        user == other.user &&
        createdAt == other.createdAt &&
        eventDate == other.eventDate &&
        dataType == other.dataType &&
        sourceId == other.sourceId &&
        sourceName == other.sourceName &&
        platform == other.platform &&
        steps == other.steps &&
        energyTotal == other.energyTotal &&
        energyActive == other.energyActive &&
        heartRateResting == other.heartRateResting &&
        activityLight == other.activityLight &&
        activityModerate == other.activityModerate &&
        activityVigorous == other.activityVigorous &&
        sleepTotal == other.sleepTotal &&
        sleepDeep == other.sleepDeep &&
        sleepRem == other.sleepRem &&
        sleepLight == other.sleepLight &&
        sleepAwake == other.sleepAwake &&
        sleepStart == other.sleepStart &&
        sleepEnd == other.sleepEnd &&
        height == other.height &&
        weight == other.weight &&
        bmi == other.bmi &&
        waist == other.waist &&
        bodyFat == other.bodyFat &&
        vo2Max == other.vo2Max &&
        hrvDaily == other.hrvDaily &&
        hrvDeep == other.hrvDeep &&
        smoking == other.smoking &&
        bpSystolic == other.bpSystolic &&
        bpDiastolic == other.bpDiastolic &&
        glucoseRandom == other.glucoseRandom &&
        glucoseHbA1c == other.glucoseHbA1c &&
        workoutDistance == other.workoutDistance &&
        workoutType == other.workoutType &&
        workoutCalories == other.workoutCalories &&
        workoutManualEntry == other.workoutManualEntry &&
        energyResting == other.energyResting &&
        hrvUnit == other.hrvUnit &&
        spo2Avg == other.spo2Avg &&
        spo2Min == other.spo2Min &&
        spo2Max == other.spo2Max &&
        breathingRate == other.breathingRate &&
        muscleMass == other.muscleMass &&
        fitnessAge == other.fitnessAge &&
        timeInDaylight == other.timeInDaylight &&
        workoutHeartRateRelative == other.workoutHeartRateRelative &&
        workoutHeartRateAverage == other.workoutHeartRateAverage &&
        workoutHeartRateMax == other.workoutHeartRateMax &&
        workoutDuration == other.workoutDuration &&
        standingMinutes == other.standingMinutes &&
        standHours == other.standHours;
  }

  @override
  int get hashCode => const ListEquality().hash([
        user,
        createdAt,
        eventDate,
        dataType,
        sourceId,
        sourceName,
        platform,
        steps,
        energyTotal,
        energyActive,
        heartRateResting,
        activityLight,
        activityModerate,
        activityVigorous,
        sleepTotal,
        sleepDeep,
        sleepRem,
        sleepLight,
        sleepAwake,
        sleepStart,
        sleepEnd,
        height,
        weight,
        bmi,
        waist,
        bodyFat,
        vo2Max,
        hrvDaily,
        hrvDeep,
        smoking,
        bpSystolic,
        bpDiastolic,
        glucoseRandom,
        glucoseHbA1c,
        workoutDistance,
        workoutType,
        workoutCalories,
        workoutManualEntry,
        energyResting,
        hrvUnit,
        spo2Avg,
        spo2Min,
        spo2Max,
        breathingRate,
        muscleMass,
        fitnessAge,
        timeInDaylight,
        workoutHeartRateRelative,
        workoutHeartRateAverage,
        workoutHeartRateMax,
        workoutDuration,
        standingMinutes,
        standHours
      ]);
}

CombinedDataStruct createCombinedDataStruct({
  DocumentReference? user,
  DateTime? createdAt,
  DateTime? eventDate,
  String? dataType,
  String? sourceId,
  String? sourceName,
  String? platform,
  int? steps,
  int? energyTotal,
  int? energyActive,
  int? heartRateResting,
  int? activityLight,
  int? activityModerate,
  int? activityVigorous,
  int? sleepTotal,
  int? sleepDeep,
  int? sleepRem,
  int? sleepLight,
  int? sleepAwake,
  DateTime? sleepStart,
  DateTime? sleepEnd,
  double? height,
  double? weight,
  double? bmi,
  double? waist,
  double? bodyFat,
  double? vo2Max,
  double? hrvDaily,
  double? hrvDeep,
  bool? smoking,
  int? bpSystolic,
  int? bpDiastolic,
  double? glucoseRandom,
  double? glucoseHbA1c,
  double? workoutDistance,
  String? workoutType,
  int? workoutCalories,
  bool? workoutManualEntry,
  int? energyResting,
  String? hrvUnit,
  double? spo2Avg,
  double? spo2Min,
  double? spo2Max,
  double? breathingRate,
  double? muscleMass,
  double? fitnessAge,
  double? timeInDaylight,
  double? workoutHeartRateRelative,
  double? workoutHeartRateAverage,
  double? workoutHeartRateMax,
  double? workoutDuration,
  double? standingMinutes,
  double? standHours,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CombinedDataStruct(
      user: user,
      createdAt: createdAt,
      eventDate: eventDate,
      dataType: dataType,
      sourceId: sourceId,
      sourceName: sourceName,
      platform: platform,
      steps: steps,
      energyTotal: energyTotal,
      energyActive: energyActive,
      heartRateResting: heartRateResting,
      activityLight: activityLight,
      activityModerate: activityModerate,
      activityVigorous: activityVigorous,
      sleepTotal: sleepTotal,
      sleepDeep: sleepDeep,
      sleepRem: sleepRem,
      sleepLight: sleepLight,
      sleepAwake: sleepAwake,
      sleepStart: sleepStart,
      sleepEnd: sleepEnd,
      height: height,
      weight: weight,
      bmi: bmi,
      waist: waist,
      bodyFat: bodyFat,
      vo2Max: vo2Max,
      hrvDaily: hrvDaily,
      hrvDeep: hrvDeep,
      smoking: smoking,
      bpSystolic: bpSystolic,
      bpDiastolic: bpDiastolic,
      glucoseRandom: glucoseRandom,
      glucoseHbA1c: glucoseHbA1c,
      workoutDistance: workoutDistance,
      workoutType: workoutType,
      workoutCalories: workoutCalories,
      workoutManualEntry: workoutManualEntry,
      energyResting: energyResting,
      hrvUnit: hrvUnit,
      spo2Avg: spo2Avg,
      spo2Min: spo2Min,
      spo2Max: spo2Max,
      breathingRate: breathingRate,
      muscleMass: muscleMass,
      fitnessAge: fitnessAge,
      timeInDaylight: timeInDaylight,
      workoutHeartRateRelative: workoutHeartRateRelative,
      workoutHeartRateAverage: workoutHeartRateAverage,
      workoutHeartRateMax: workoutHeartRateMax,
      workoutDuration: workoutDuration,
      standingMinutes: standingMinutes,
      standHours: standHours,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CombinedDataStruct? updateCombinedDataStruct(
  CombinedDataStruct? combinedData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    combinedData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCombinedDataStructData(
  Map<String, dynamic> firestoreData,
  CombinedDataStruct? combinedData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (combinedData == null) {
    return;
  }
  if (combinedData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && combinedData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final combinedDataData =
      getCombinedDataFirestoreData(combinedData, forFieldValue);
  final nestedData =
      combinedDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = combinedData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCombinedDataFirestoreData(
  CombinedDataStruct? combinedData, [
  bool forFieldValue = false,
]) {
  if (combinedData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(combinedData.toMap());

  // Add any Firestore field values
  combinedData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCombinedDataListFirestoreData(
  List<CombinedDataStruct>? combinedDatas,
) =>
    combinedDatas?.map((e) => getCombinedDataFirestoreData(e, true)).toList() ??
    [];
