import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HfRecord extends FirestoreRecord {
  HfRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "finished_at" field.
  DateTime? _finishedAt;
  DateTime? get finishedAt => _finishedAt;
  bool hasFinishedAt() => _finishedAt != null;

  // "gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "bmi" field.
  double? _bmi;
  double get bmi => _bmi ?? 0.0;
  bool hasBmi() => _bmi != null;

  // "smoking" field.
  Smoking? _smoking;
  Smoking? get smoking => _smoking;
  bool hasSmoking() => _smoking != null;

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  bool hasSteps() => _steps != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "hrv" field.
  double? _hrv;
  double get hrv => _hrv ?? 0.0;
  bool hasHrv() => _hrv != null;

  // "rhr" field.
  int? _rhr;
  int get rhr => _rhr ?? 0;
  bool hasRhr() => _rhr != null;

  // "vo2max" field.
  int? _vo2max;
  int get vo2max => _vo2max ?? 0;
  bool hasVo2max() => _vo2max != null;

  // "sleep" field.
  double? _sleep;
  double get sleep => _sleep ?? 0.0;
  bool hasSleep() => _sleep != null;

  // "pa_days" field.
  int? _paDays;
  int get paDays => _paDays ?? 0;
  bool hasPaDays() => _paDays != null;

  // "bp_sys" field.
  int? _bpSys;
  int get bpSys => _bpSys ?? 0;
  bool hasBpSys() => _bpSys != null;

  // "bp_dia" field.
  int? _bpDia;
  int get bpDia => _bpDia ?? 0;
  bool hasBpDia() => _bpDia != null;

  // "chol" field.
  double? _chol;
  double get chol => _chol ?? 0.0;
  bool hasChol() => _chol != null;

  // "gluc" field.
  double? _gluc;
  double get gluc => _gluc ?? 0.0;
  bool hasGluc() => _gluc != null;

  // "nutrition_fast_food" field.
  DietFrequency? _nutritionFastFood;
  DietFrequency? get nutritionFastFood => _nutritionFastFood;
  bool hasNutritionFastFood() => _nutritionFastFood != null;

  // "nutrition_red_meat" field.
  DietFrequency? _nutritionRedMeat;
  DietFrequency? get nutritionRedMeat => _nutritionRedMeat;
  bool hasNutritionRedMeat() => _nutritionRedMeat != null;

  // "nutrition_fruit" field.
  DietFrequency? _nutritionFruit;
  DietFrequency? get nutritionFruit => _nutritionFruit;
  bool hasNutritionFruit() => _nutritionFruit != null;

  // "steps_class" field.
  String? _stepsClass;
  String get stepsClass => _stepsClass ?? '';
  bool hasStepsClass() => _stepsClass != null;

  // "rhr_class" field.
  String? _rhrClass;
  String get rhrClass => _rhrClass ?? '';
  bool hasRhrClass() => _rhrClass != null;

  // "hrv_class" field.
  String? _hrvClass;
  String get hrvClass => _hrvClass ?? '';
  bool hasHrvClass() => _hrvClass != null;

  // "vo2max_class" field.
  String? _vo2maxClass;
  String get vo2maxClass => _vo2maxClass ?? '';
  bool hasVo2maxClass() => _vo2maxClass != null;

  // "calories_class" field.
  String? _caloriesClass;
  String get caloriesClass => _caloriesClass ?? '';
  bool hasCaloriesClass() => _caloriesClass != null;

  // "sleep_class" field.
  String? _sleepClass;
  String get sleepClass => _sleepClass ?? '';
  bool hasSleepClass() => _sleepClass != null;

  // "pa_class" field.
  String? _paClass;
  String get paClass => _paClass ?? '';
  bool hasPaClass() => _paClass != null;

  // "bmi_class" field.
  String? _bmiClass;
  String get bmiClass => _bmiClass ?? '';
  bool hasBmiClass() => _bmiClass != null;

  // "chol_class" field.
  String? _cholClass;
  String get cholClass => _cholClass ?? '';
  bool hasCholClass() => _cholClass != null;

  // "gluc_class" field.
  String? _glucClass;
  String get glucClass => _glucClass ?? '';
  bool hasGlucClass() => _glucClass != null;

  // "bp_class" field.
  String? _bpClass;
  String get bpClass => _bpClass ?? '';
  bool hasBpClass() => _bpClass != null;

  // "alc_class" field.
  String? _alcClass;
  String get alcClass => _alcClass ?? '';
  bool hasAlcClass() => _alcClass != null;

  // "count_healthy" field.
  int? _countHealthy;
  int get countHealthy => _countHealthy ?? 0;
  bool hasCountHealthy() => _countHealthy != null;

  // "count_unhealthy" field.
  int? _countUnhealthy;
  int get countUnhealthy => _countUnhealthy ?? 0;
  bool hasCountUnhealthy() => _countUnhealthy != null;

  // "count_unknown" field.
  int? _countUnknown;
  int get countUnknown => _countUnknown ?? 0;
  bool hasCountUnknown() => _countUnknown != null;

  // "alcohol" field.
  int? _alcohol;
  int get alcohol => _alcohol ?? 0;
  bool hasAlcohol() => _alcohol != null;

  // "nutrition_class" field.
  String? _nutritionClass;
  String get nutritionClass => _nutritionClass ?? '';
  bool hasNutritionClass() => _nutritionClass != null;

  // "hrv_unit" field.
  String? _hrvUnit;
  String get hrvUnit => _hrvUnit ?? '';
  bool hasHrvUnit() => _hrvUnit != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _finishedAt = snapshotData['finished_at'] as DateTime?;
    _gender = snapshotData['gender'] is Gender
        ? snapshotData['gender']
        : deserializeEnum<Gender>(snapshotData['gender']);
    _age = castToType<int>(snapshotData['age']);
    _bmi = castToType<double>(snapshotData['bmi']);
    _smoking = snapshotData['smoking'] is Smoking
        ? snapshotData['smoking']
        : deserializeEnum<Smoking>(snapshotData['smoking']);
    _steps = castToType<int>(snapshotData['steps']);
    _calories = castToType<int>(snapshotData['calories']);
    _hrv = castToType<double>(snapshotData['hrv']);
    _rhr = castToType<int>(snapshotData['rhr']);
    _vo2max = castToType<int>(snapshotData['vo2max']);
    _sleep = castToType<double>(snapshotData['sleep']);
    _paDays = castToType<int>(snapshotData['pa_days']);
    _bpSys = castToType<int>(snapshotData['bp_sys']);
    _bpDia = castToType<int>(snapshotData['bp_dia']);
    _chol = castToType<double>(snapshotData['chol']);
    _gluc = castToType<double>(snapshotData['gluc']);
    _nutritionFastFood = snapshotData['nutrition_fast_food'] is DietFrequency
        ? snapshotData['nutrition_fast_food']
        : deserializeEnum<DietFrequency>(snapshotData['nutrition_fast_food']);
    _nutritionRedMeat = snapshotData['nutrition_red_meat'] is DietFrequency
        ? snapshotData['nutrition_red_meat']
        : deserializeEnum<DietFrequency>(snapshotData['nutrition_red_meat']);
    _nutritionFruit = snapshotData['nutrition_fruit'] is DietFrequency
        ? snapshotData['nutrition_fruit']
        : deserializeEnum<DietFrequency>(snapshotData['nutrition_fruit']);
    _stepsClass = snapshotData['steps_class'] as String?;
    _rhrClass = snapshotData['rhr_class'] as String?;
    _hrvClass = snapshotData['hrv_class'] as String?;
    _vo2maxClass = snapshotData['vo2max_class'] as String?;
    _caloriesClass = snapshotData['calories_class'] as String?;
    _sleepClass = snapshotData['sleep_class'] as String?;
    _paClass = snapshotData['pa_class'] as String?;
    _bmiClass = snapshotData['bmi_class'] as String?;
    _cholClass = snapshotData['chol_class'] as String?;
    _glucClass = snapshotData['gluc_class'] as String?;
    _bpClass = snapshotData['bp_class'] as String?;
    _alcClass = snapshotData['alc_class'] as String?;
    _countHealthy = castToType<int>(snapshotData['count_healthy']);
    _countUnhealthy = castToType<int>(snapshotData['count_unhealthy']);
    _countUnknown = castToType<int>(snapshotData['count_unknown']);
    _alcohol = castToType<int>(snapshotData['alcohol']);
    _nutritionClass = snapshotData['nutrition_class'] as String?;
    _hrvUnit = snapshotData['hrv_unit'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('hf')
          : FirebaseFirestore.instance.collectionGroup('hf');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('hf').doc(id);

  static Stream<HfRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HfRecord.fromSnapshot(s));

  static Future<HfRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HfRecord.fromSnapshot(s));

  static HfRecord fromSnapshot(DocumentSnapshot snapshot) => HfRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HfRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HfRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HfRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HfRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHfRecordData({
  DateTime? createdAt,
  DateTime? finishedAt,
  Gender? gender,
  int? age,
  double? bmi,
  Smoking? smoking,
  int? steps,
  int? calories,
  double? hrv,
  int? rhr,
  int? vo2max,
  double? sleep,
  int? paDays,
  int? bpSys,
  int? bpDia,
  double? chol,
  double? gluc,
  DietFrequency? nutritionFastFood,
  DietFrequency? nutritionRedMeat,
  DietFrequency? nutritionFruit,
  String? stepsClass,
  String? rhrClass,
  String? hrvClass,
  String? vo2maxClass,
  String? caloriesClass,
  String? sleepClass,
  String? paClass,
  String? bmiClass,
  String? cholClass,
  String? glucClass,
  String? bpClass,
  String? alcClass,
  int? countHealthy,
  int? countUnhealthy,
  int? countUnknown,
  int? alcohol,
  String? nutritionClass,
  String? hrvUnit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'finished_at': finishedAt,
      'gender': gender,
      'age': age,
      'bmi': bmi,
      'smoking': smoking,
      'steps': steps,
      'calories': calories,
      'hrv': hrv,
      'rhr': rhr,
      'vo2max': vo2max,
      'sleep': sleep,
      'pa_days': paDays,
      'bp_sys': bpSys,
      'bp_dia': bpDia,
      'chol': chol,
      'gluc': gluc,
      'nutrition_fast_food': nutritionFastFood,
      'nutrition_red_meat': nutritionRedMeat,
      'nutrition_fruit': nutritionFruit,
      'steps_class': stepsClass,
      'rhr_class': rhrClass,
      'hrv_class': hrvClass,
      'vo2max_class': vo2maxClass,
      'calories_class': caloriesClass,
      'sleep_class': sleepClass,
      'pa_class': paClass,
      'bmi_class': bmiClass,
      'chol_class': cholClass,
      'gluc_class': glucClass,
      'bp_class': bpClass,
      'alc_class': alcClass,
      'count_healthy': countHealthy,
      'count_unhealthy': countUnhealthy,
      'count_unknown': countUnknown,
      'alcohol': alcohol,
      'nutrition_class': nutritionClass,
      'hrv_unit': hrvUnit,
    }.withoutNulls,
  );

  return firestoreData;
}

class HfRecordDocumentEquality implements Equality<HfRecord> {
  const HfRecordDocumentEquality();

  @override
  bool equals(HfRecord? e1, HfRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.finishedAt == e2?.finishedAt &&
        e1?.gender == e2?.gender &&
        e1?.age == e2?.age &&
        e1?.bmi == e2?.bmi &&
        e1?.smoking == e2?.smoking &&
        e1?.steps == e2?.steps &&
        e1?.calories == e2?.calories &&
        e1?.hrv == e2?.hrv &&
        e1?.rhr == e2?.rhr &&
        e1?.vo2max == e2?.vo2max &&
        e1?.sleep == e2?.sleep &&
        e1?.paDays == e2?.paDays &&
        e1?.bpSys == e2?.bpSys &&
        e1?.bpDia == e2?.bpDia &&
        e1?.chol == e2?.chol &&
        e1?.gluc == e2?.gluc &&
        e1?.nutritionFastFood == e2?.nutritionFastFood &&
        e1?.nutritionRedMeat == e2?.nutritionRedMeat &&
        e1?.nutritionFruit == e2?.nutritionFruit &&
        e1?.stepsClass == e2?.stepsClass &&
        e1?.rhrClass == e2?.rhrClass &&
        e1?.hrvClass == e2?.hrvClass &&
        e1?.vo2maxClass == e2?.vo2maxClass &&
        e1?.caloriesClass == e2?.caloriesClass &&
        e1?.sleepClass == e2?.sleepClass &&
        e1?.paClass == e2?.paClass &&
        e1?.bmiClass == e2?.bmiClass &&
        e1?.cholClass == e2?.cholClass &&
        e1?.glucClass == e2?.glucClass &&
        e1?.bpClass == e2?.bpClass &&
        e1?.alcClass == e2?.alcClass &&
        e1?.countHealthy == e2?.countHealthy &&
        e1?.countUnhealthy == e2?.countUnhealthy &&
        e1?.countUnknown == e2?.countUnknown &&
        e1?.alcohol == e2?.alcohol &&
        e1?.nutritionClass == e2?.nutritionClass &&
        e1?.hrvUnit == e2?.hrvUnit;
  }

  @override
  int hash(HfRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.finishedAt,
        e?.gender,
        e?.age,
        e?.bmi,
        e?.smoking,
        e?.steps,
        e?.calories,
        e?.hrv,
        e?.rhr,
        e?.vo2max,
        e?.sleep,
        e?.paDays,
        e?.bpSys,
        e?.bpDia,
        e?.chol,
        e?.gluc,
        e?.nutritionFastFood,
        e?.nutritionRedMeat,
        e?.nutritionFruit,
        e?.stepsClass,
        e?.rhrClass,
        e?.hrvClass,
        e?.vo2maxClass,
        e?.caloriesClass,
        e?.sleepClass,
        e?.paClass,
        e?.bmiClass,
        e?.cholClass,
        e?.glucClass,
        e?.bpClass,
        e?.alcClass,
        e?.countHealthy,
        e?.countUnhealthy,
        e?.countUnknown,
        e?.alcohol,
        e?.nutritionClass,
        e?.hrvUnit
      ]);

  @override
  bool isValidKey(Object? o) => o is HfRecord;
}
