import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaDataRecord extends FirestoreRecord {
  PaDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "data_type" field.
  String? _dataType;
  String get dataType => _dataType ?? '';
  bool hasDataType() => _dataType != null;

  // "source_id" field.
  String? _sourceId;
  String get sourceId => _sourceId ?? '';
  bool hasSourceId() => _sourceId != null;

  // "source_name" field.
  String? _sourceName;
  String get sourceName => _sourceName ?? '';
  bool hasSourceName() => _sourceName != null;

  // "platform" field.
  String? _platform;
  String get platform => _platform ?? '';
  bool hasPlatform() => _platform != null;

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  bool hasSteps() => _steps != null;

  // "energy_total" field.
  int? _energyTotal;
  int get energyTotal => _energyTotal ?? 0;
  bool hasEnergyTotal() => _energyTotal != null;

  // "energy_active" field.
  int? _energyActive;
  int get energyActive => _energyActive ?? 0;
  bool hasEnergyActive() => _energyActive != null;

  // "workout_distance" field.
  double? _workoutDistance;
  double get workoutDistance => _workoutDistance ?? 0.0;
  bool hasWorkoutDistance() => _workoutDistance != null;

  // "workout_heart_rate_relative" field.
  double? _workoutHeartRateRelative;
  double get workoutHeartRateRelative => _workoutHeartRateRelative ?? 0.0;
  bool hasWorkoutHeartRateRelative() => _workoutHeartRateRelative != null;

  // "workout_type" field.
  String? _workoutType;
  String get workoutType => _workoutType ?? '';
  bool hasWorkoutType() => _workoutType != null;

  // "workout_calories" field.
  int? _workoutCalories;
  int get workoutCalories => _workoutCalories ?? 0;
  bool hasWorkoutCalories() => _workoutCalories != null;

  // "workout_manual_entry" field.
  bool? _workoutManualEntry;
  bool get workoutManualEntry => _workoutManualEntry ?? false;
  bool hasWorkoutManualEntry() => _workoutManualEntry != null;

  // "heart_rate_resting" field.
  int? _heartRateResting;
  int get heartRateResting => _heartRateResting ?? 0;
  bool hasHeartRateResting() => _heartRateResting != null;

  // "activity_light" field.
  int? _activityLight;
  int get activityLight => _activityLight ?? 0;
  bool hasActivityLight() => _activityLight != null;

  // "activity_moderate" field.
  int? _activityModerate;
  int get activityModerate => _activityModerate ?? 0;
  bool hasActivityModerate() => _activityModerate != null;

  // "activity_vigorous" field.
  int? _activityVigorous;
  int get activityVigorous => _activityVigorous ?? 0;
  bool hasActivityVigorous() => _activityVigorous != null;

  // "sleep_total" field.
  int? _sleepTotal;
  int get sleepTotal => _sleepTotal ?? 0;
  bool hasSleepTotal() => _sleepTotal != null;

  // "sleep_awake" field.
  int? _sleepAwake;
  int get sleepAwake => _sleepAwake ?? 0;
  bool hasSleepAwake() => _sleepAwake != null;

  // "sleep_deep" field.
  int? _sleepDeep;
  int get sleepDeep => _sleepDeep ?? 0;
  bool hasSleepDeep() => _sleepDeep != null;

  // "sleep_rem" field.
  int? _sleepRem;
  int get sleepRem => _sleepRem ?? 0;
  bool hasSleepRem() => _sleepRem != null;

  // "sleep_light" field.
  int? _sleepLight;
  int get sleepLight => _sleepLight ?? 0;
  bool hasSleepLight() => _sleepLight != null;

  // "sleep_start" field.
  DateTime? _sleepStart;
  DateTime? get sleepStart => _sleepStart;
  bool hasSleepStart() => _sleepStart != null;

  // "sleep_end" field.
  DateTime? _sleepEnd;
  DateTime? get sleepEnd => _sleepEnd;
  bool hasSleepEnd() => _sleepEnd != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "bmi" field.
  double? _bmi;
  double get bmi => _bmi ?? 0.0;
  bool hasBmi() => _bmi != null;

  // "waist" field.
  double? _waist;
  double get waist => _waist ?? 0.0;
  bool hasWaist() => _waist != null;

  // "body_fat" field.
  double? _bodyFat;
  double get bodyFat => _bodyFat ?? 0.0;
  bool hasBodyFat() => _bodyFat != null;

  // "muscle_mass" field.
  double? _muscleMass;
  double get muscleMass => _muscleMass ?? 0.0;
  bool hasMuscleMass() => _muscleMass != null;

  // "vo2_max" field.
  double? _vo2Max;
  double get vo2Max => _vo2Max ?? 0.0;
  bool hasVo2Max() => _vo2Max != null;

  // "fitness_age" field.
  double? _fitnessAge;
  double get fitnessAge => _fitnessAge ?? 0.0;
  bool hasFitnessAge() => _fitnessAge != null;

  // "hrv_daily" field.
  double? _hrvDaily;
  double get hrvDaily => _hrvDaily ?? 0.0;
  bool hasHrvDaily() => _hrvDaily != null;

  // "hrv_deep" field.
  double? _hrvDeep;
  double get hrvDeep => _hrvDeep ?? 0.0;
  bool hasHrvDeep() => _hrvDeep != null;

  // "smoking" field.
  bool? _smoking;
  bool get smoking => _smoking ?? false;
  bool hasSmoking() => _smoking != null;

  // "bp_systolic" field.
  int? _bpSystolic;
  int get bpSystolic => _bpSystolic ?? 0;
  bool hasBpSystolic() => _bpSystolic != null;

  // "glucose_random" field.
  double? _glucoseRandom;
  double get glucoseRandom => _glucoseRandom ?? 0.0;
  bool hasGlucoseRandom() => _glucoseRandom != null;

  // "glucose_HbA1c" field.
  double? _glucoseHbA1c;
  double get glucoseHbA1c => _glucoseHbA1c ?? 0.0;
  bool hasGlucoseHbA1c() => _glucoseHbA1c != null;

  // "energy_resting" field.
  int? _energyResting;
  int get energyResting => _energyResting ?? 0;
  bool hasEnergyResting() => _energyResting != null;

  // "weekday" field.
  String? _weekday;
  String get weekday => _weekday ?? '';
  bool hasWeekday() => _weekday != null;

  // "weekday_no" field.
  int? _weekdayNo;
  int get weekdayNo => _weekdayNo ?? 0;
  bool hasWeekdayNo() => _weekdayNo != null;

  // "week" field.
  int? _week;
  int get week => _week ?? 0;
  bool hasWeek() => _week != null;

  // "week_start_date" field.
  DateTime? _weekStartDate;
  DateTime? get weekStartDate => _weekStartDate;
  bool hasWeekStartDate() => _weekStartDate != null;

  // "hrv_unit" field.
  String? _hrvUnit;
  String get hrvUnit => _hrvUnit ?? '';
  bool hasHrvUnit() => _hrvUnit != null;

  // "bp_diastolic" field.
  int? _bpDiastolic;
  int get bpDiastolic => _bpDiastolic ?? 0;
  bool hasBpDiastolic() => _bpDiastolic != null;

  // "spo2_avg" field.
  double? _spo2Avg;
  double get spo2Avg => _spo2Avg ?? 0.0;
  bool hasSpo2Avg() => _spo2Avg != null;

  // "spo2_min" field.
  double? _spo2Min;
  double get spo2Min => _spo2Min ?? 0.0;
  bool hasSpo2Min() => _spo2Min != null;

  // "spo2_max" field.
  double? _spo2Max;
  double get spo2Max => _spo2Max ?? 0.0;
  bool hasSpo2Max() => _spo2Max != null;

  // "breathing_rate" field.
  double? _breathingRate;
  double get breathingRate => _breathingRate ?? 0.0;
  bool hasBreathingRate() => _breathingRate != null;

  // "workout_heart_rate_average" field.
  double? _workoutHeartRateAverage;
  double get workoutHeartRateAverage => _workoutHeartRateAverage ?? 0.0;
  bool hasWorkoutHeartRateAverage() => _workoutHeartRateAverage != null;

  // "workout_heart_rate_max" field.
  double? _workoutHeartRateMax;
  double get workoutHeartRateMax => _workoutHeartRateMax ?? 0.0;
  bool hasWorkoutHeartRateMax() => _workoutHeartRateMax != null;

  // "workout_duration" field.
  double? _workoutDuration;
  double get workoutDuration => _workoutDuration ?? 0.0;
  bool hasWorkoutDuration() => _workoutDuration != null;

  // "standing_minutes" field.
  double? _standingMinutes;
  double get standingMinutes => _standingMinutes ?? 0.0;
  bool hasStandingMinutes() => _standingMinutes != null;

  // "stand_hours" field.
  double? _standHours;
  double get standHours => _standHours ?? 0.0;
  bool hasStandHours() => _standHours != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _dataType = snapshotData['data_type'] as String?;
    _sourceId = snapshotData['source_id'] as String?;
    _sourceName = snapshotData['source_name'] as String?;
    _platform = snapshotData['platform'] as String?;
    _steps = castToType<int>(snapshotData['steps']);
    _energyTotal = castToType<int>(snapshotData['energy_total']);
    _energyActive = castToType<int>(snapshotData['energy_active']);
    _workoutDistance = castToType<double>(snapshotData['workout_distance']);
    _workoutHeartRateRelative =
        castToType<double>(snapshotData['workout_heart_rate_relative']);
    _workoutType = snapshotData['workout_type'] as String?;
    _workoutCalories = castToType<int>(snapshotData['workout_calories']);
    _workoutManualEntry = snapshotData['workout_manual_entry'] as bool?;
    _heartRateResting = castToType<int>(snapshotData['heart_rate_resting']);
    _activityLight = castToType<int>(snapshotData['activity_light']);
    _activityModerate = castToType<int>(snapshotData['activity_moderate']);
    _activityVigorous = castToType<int>(snapshotData['activity_vigorous']);
    _sleepTotal = castToType<int>(snapshotData['sleep_total']);
    _sleepAwake = castToType<int>(snapshotData['sleep_awake']);
    _sleepDeep = castToType<int>(snapshotData['sleep_deep']);
    _sleepRem = castToType<int>(snapshotData['sleep_rem']);
    _sleepLight = castToType<int>(snapshotData['sleep_light']);
    _sleepStart = snapshotData['sleep_start'] as DateTime?;
    _sleepEnd = snapshotData['sleep_end'] as DateTime?;
    _height = castToType<double>(snapshotData['height']);
    _weight = castToType<double>(snapshotData['weight']);
    _bmi = castToType<double>(snapshotData['bmi']);
    _waist = castToType<double>(snapshotData['waist']);
    _bodyFat = castToType<double>(snapshotData['body_fat']);
    _muscleMass = castToType<double>(snapshotData['muscle_mass']);
    _vo2Max = castToType<double>(snapshotData['vo2_max']);
    _fitnessAge = castToType<double>(snapshotData['fitness_age']);
    _hrvDaily = castToType<double>(snapshotData['hrv_daily']);
    _hrvDeep = castToType<double>(snapshotData['hrv_deep']);
    _smoking = snapshotData['smoking'] as bool?;
    _bpSystolic = castToType<int>(snapshotData['bp_systolic']);
    _glucoseRandom = castToType<double>(snapshotData['glucose_random']);
    _glucoseHbA1c = castToType<double>(snapshotData['glucose_HbA1c']);
    _energyResting = castToType<int>(snapshotData['energy_resting']);
    _weekday = snapshotData['weekday'] as String?;
    _weekdayNo = castToType<int>(snapshotData['weekday_no']);
    _week = castToType<int>(snapshotData['week']);
    _weekStartDate = snapshotData['week_start_date'] as DateTime?;
    _hrvUnit = snapshotData['hrv_unit'] as String?;
    _bpDiastolic = castToType<int>(snapshotData['bp_diastolic']);
    _spo2Avg = castToType<double>(snapshotData['spo2_avg']);
    _spo2Min = castToType<double>(snapshotData['spo2_min']);
    _spo2Max = castToType<double>(snapshotData['spo2_max']);
    _breathingRate = castToType<double>(snapshotData['breathing_rate']);
    _workoutHeartRateAverage =
        castToType<double>(snapshotData['workout_heart_rate_average']);
    _workoutHeartRateMax =
        castToType<double>(snapshotData['workout_heart_rate_max']);
    _workoutDuration = castToType<double>(snapshotData['workout_duration']);
    _standingMinutes = castToType<double>(snapshotData['standing_minutes']);
    _standHours = castToType<double>(snapshotData['stand_hours']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pa_data')
          : FirebaseFirestore.instance.collectionGroup('pa_data');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pa_data').doc(id);

  static Stream<PaDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaDataRecord.fromSnapshot(s));

  static Future<PaDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaDataRecord.fromSnapshot(s));

  static PaDataRecord fromSnapshot(DocumentSnapshot snapshot) => PaDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaDataRecordData({
  DateTime? createdAt,
  DateTime? eventDate,
  String? dataType,
  String? sourceId,
  String? sourceName,
  String? platform,
  int? steps,
  int? energyTotal,
  int? energyActive,
  double? workoutDistance,
  double? workoutHeartRateRelative,
  String? workoutType,
  int? workoutCalories,
  bool? workoutManualEntry,
  int? heartRateResting,
  int? activityLight,
  int? activityModerate,
  int? activityVigorous,
  int? sleepTotal,
  int? sleepAwake,
  int? sleepDeep,
  int? sleepRem,
  int? sleepLight,
  DateTime? sleepStart,
  DateTime? sleepEnd,
  double? height,
  double? weight,
  double? bmi,
  double? waist,
  double? bodyFat,
  double? muscleMass,
  double? vo2Max,
  double? fitnessAge,
  double? hrvDaily,
  double? hrvDeep,
  bool? smoking,
  int? bpSystolic,
  double? glucoseRandom,
  double? glucoseHbA1c,
  int? energyResting,
  String? weekday,
  int? weekdayNo,
  int? week,
  DateTime? weekStartDate,
  String? hrvUnit,
  int? bpDiastolic,
  double? spo2Avg,
  double? spo2Min,
  double? spo2Max,
  double? breathingRate,
  double? workoutHeartRateAverage,
  double? workoutHeartRateMax,
  double? workoutDuration,
  double? standingMinutes,
  double? standHours,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'event_date': eventDate,
      'data_type': dataType,
      'source_id': sourceId,
      'source_name': sourceName,
      'platform': platform,
      'steps': steps,
      'energy_total': energyTotal,
      'energy_active': energyActive,
      'workout_distance': workoutDistance,
      'workout_heart_rate_relative': workoutHeartRateRelative,
      'workout_type': workoutType,
      'workout_calories': workoutCalories,
      'workout_manual_entry': workoutManualEntry,
      'heart_rate_resting': heartRateResting,
      'activity_light': activityLight,
      'activity_moderate': activityModerate,
      'activity_vigorous': activityVigorous,
      'sleep_total': sleepTotal,
      'sleep_awake': sleepAwake,
      'sleep_deep': sleepDeep,
      'sleep_rem': sleepRem,
      'sleep_light': sleepLight,
      'sleep_start': sleepStart,
      'sleep_end': sleepEnd,
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'waist': waist,
      'body_fat': bodyFat,
      'muscle_mass': muscleMass,
      'vo2_max': vo2Max,
      'fitness_age': fitnessAge,
      'hrv_daily': hrvDaily,
      'hrv_deep': hrvDeep,
      'smoking': smoking,
      'bp_systolic': bpSystolic,
      'glucose_random': glucoseRandom,
      'glucose_HbA1c': glucoseHbA1c,
      'energy_resting': energyResting,
      'weekday': weekday,
      'weekday_no': weekdayNo,
      'week': week,
      'week_start_date': weekStartDate,
      'hrv_unit': hrvUnit,
      'bp_diastolic': bpDiastolic,
      'spo2_avg': spo2Avg,
      'spo2_min': spo2Min,
      'spo2_max': spo2Max,
      'breathing_rate': breathingRate,
      'workout_heart_rate_average': workoutHeartRateAverage,
      'workout_heart_rate_max': workoutHeartRateMax,
      'workout_duration': workoutDuration,
      'standing_minutes': standingMinutes,
      'stand_hours': standHours,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaDataRecordDocumentEquality implements Equality<PaDataRecord> {
  const PaDataRecordDocumentEquality();

  @override
  bool equals(PaDataRecord? e1, PaDataRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.eventDate == e2?.eventDate &&
        e1?.dataType == e2?.dataType &&
        e1?.sourceId == e2?.sourceId &&
        e1?.sourceName == e2?.sourceName &&
        e1?.platform == e2?.platform &&
        e1?.steps == e2?.steps &&
        e1?.energyTotal == e2?.energyTotal &&
        e1?.energyActive == e2?.energyActive &&
        e1?.workoutDistance == e2?.workoutDistance &&
        e1?.workoutHeartRateRelative == e2?.workoutHeartRateRelative &&
        e1?.workoutType == e2?.workoutType &&
        e1?.workoutCalories == e2?.workoutCalories &&
        e1?.workoutManualEntry == e2?.workoutManualEntry &&
        e1?.heartRateResting == e2?.heartRateResting &&
        e1?.activityLight == e2?.activityLight &&
        e1?.activityModerate == e2?.activityModerate &&
        e1?.activityVigorous == e2?.activityVigorous &&
        e1?.sleepTotal == e2?.sleepTotal &&
        e1?.sleepAwake == e2?.sleepAwake &&
        e1?.sleepDeep == e2?.sleepDeep &&
        e1?.sleepRem == e2?.sleepRem &&
        e1?.sleepLight == e2?.sleepLight &&
        e1?.sleepStart == e2?.sleepStart &&
        e1?.sleepEnd == e2?.sleepEnd &&
        e1?.height == e2?.height &&
        e1?.weight == e2?.weight &&
        e1?.bmi == e2?.bmi &&
        e1?.waist == e2?.waist &&
        e1?.bodyFat == e2?.bodyFat &&
        e1?.muscleMass == e2?.muscleMass &&
        e1?.vo2Max == e2?.vo2Max &&
        e1?.fitnessAge == e2?.fitnessAge &&
        e1?.hrvDaily == e2?.hrvDaily &&
        e1?.hrvDeep == e2?.hrvDeep &&
        e1?.smoking == e2?.smoking &&
        e1?.bpSystolic == e2?.bpSystolic &&
        e1?.glucoseRandom == e2?.glucoseRandom &&
        e1?.glucoseHbA1c == e2?.glucoseHbA1c &&
        e1?.energyResting == e2?.energyResting &&
        e1?.weekday == e2?.weekday &&
        e1?.weekdayNo == e2?.weekdayNo &&
        e1?.week == e2?.week &&
        e1?.weekStartDate == e2?.weekStartDate &&
        e1?.hrvUnit == e2?.hrvUnit &&
        e1?.bpDiastolic == e2?.bpDiastolic &&
        e1?.spo2Avg == e2?.spo2Avg &&
        e1?.spo2Min == e2?.spo2Min &&
        e1?.spo2Max == e2?.spo2Max &&
        e1?.breathingRate == e2?.breathingRate &&
        e1?.workoutHeartRateAverage == e2?.workoutHeartRateAverage &&
        e1?.workoutHeartRateMax == e2?.workoutHeartRateMax &&
        e1?.workoutDuration == e2?.workoutDuration &&
        e1?.standingMinutes == e2?.standingMinutes &&
        e1?.standHours == e2?.standHours;
  }

  @override
  int hash(PaDataRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.eventDate,
        e?.dataType,
        e?.sourceId,
        e?.sourceName,
        e?.platform,
        e?.steps,
        e?.energyTotal,
        e?.energyActive,
        e?.workoutDistance,
        e?.workoutHeartRateRelative,
        e?.workoutType,
        e?.workoutCalories,
        e?.workoutManualEntry,
        e?.heartRateResting,
        e?.activityLight,
        e?.activityModerate,
        e?.activityVigorous,
        e?.sleepTotal,
        e?.sleepAwake,
        e?.sleepDeep,
        e?.sleepRem,
        e?.sleepLight,
        e?.sleepStart,
        e?.sleepEnd,
        e?.height,
        e?.weight,
        e?.bmi,
        e?.waist,
        e?.bodyFat,
        e?.muscleMass,
        e?.vo2Max,
        e?.fitnessAge,
        e?.hrvDaily,
        e?.hrvDeep,
        e?.smoking,
        e?.bpSystolic,
        e?.glucoseRandom,
        e?.glucoseHbA1c,
        e?.energyResting,
        e?.weekday,
        e?.weekdayNo,
        e?.week,
        e?.weekStartDate,
        e?.hrvUnit,
        e?.bpDiastolic,
        e?.spo2Avg,
        e?.spo2Min,
        e?.spo2Max,
        e?.breathingRate,
        e?.workoutHeartRateAverage,
        e?.workoutHeartRateMax,
        e?.workoutDuration,
        e?.standingMinutes,
        e?.standHours
      ]);

  @override
  bool isValidKey(Object? o) => o is PaDataRecord;
}
