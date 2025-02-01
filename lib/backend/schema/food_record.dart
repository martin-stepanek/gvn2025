import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodRecord extends FirestoreRecord {
  FoodRecord._(
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

  // "week_no" field.
  int? _weekNo;
  int get weekNo => _weekNo ?? 0;
  bool hasWeekNo() => _weekNo != null;

  // "week_start_date" field.
  DateTime? _weekStartDate;
  DateTime? get weekStartDate => _weekStartDate;
  bool hasWeekStartDate() => _weekStartDate != null;

  // "weekday_no" field.
  int? _weekdayNo;
  int get weekdayNo => _weekdayNo ?? 0;
  bool hasWeekdayNo() => _weekdayNo != null;

  // "weekday" field.
  Weekday? _weekday;
  Weekday? get weekday => _weekday;
  bool hasWeekday() => _weekday != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "prompted" field.
  bool? _prompted;
  bool get prompted => _prompted ?? false;
  bool hasPrompted() => _prompted != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "portion_size" field.
  String? _portionSize;
  String get portionSize => _portionSize ?? '';
  bool hasPortionSize() => _portionSize != null;

  // "portion_size_grams" field.
  double? _portionSizeGrams;
  double get portionSizeGrams => _portionSizeGrams ?? 0.0;
  bool hasPortionSizeGrams() => _portionSizeGrams != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  // "fibre_grams" field.
  double? _fibreGrams;
  double get fibreGrams => _fibreGrams ?? 0.0;
  bool hasFibreGrams() => _fibreGrams != null;

  // "protein_grams" field.
  double? _proteinGrams;
  double get proteinGrams => _proteinGrams ?? 0.0;
  bool hasProteinGrams() => _proteinGrams != null;

  // "fat_grams" field.
  double? _fatGrams;
  double get fatGrams => _fatGrams ?? 0.0;
  bool hasFatGrams() => _fatGrams != null;

  // "carbs_grams" field.
  double? _carbsGrams;
  double get carbsGrams => _carbsGrams ?? 0.0;
  bool hasCarbsGrams() => _carbsGrams != null;

  // "sugar_grams" field.
  double? _sugarGrams;
  double get sugarGrams => _sugarGrams ?? 0.0;
  bool hasSugarGrams() => _sugarGrams != null;

  // "salt_grams" field.
  double? _saltGrams;
  double get saltGrams => _saltGrams ?? 0.0;
  bool hasSaltGrams() => _saltGrams != null;

  // "satiation_level" field.
  Level? _satiationLevel;
  Level? get satiationLevel => _satiationLevel;
  bool hasSatiationLevel() => _satiationLevel != null;

  // "satisfaction_level" field.
  Level? _satisfactionLevel;
  Level? get satisfactionLevel => _satisfactionLevel;
  bool hasSatisfactionLevel() => _satisfactionLevel != null;

  // "fibre_recommended" field.
  double? _fibreRecommended;
  double get fibreRecommended => _fibreRecommended ?? 0.0;
  bool hasFibreRecommended() => _fibreRecommended != null;

  // "protein_recommended" field.
  double? _proteinRecommended;
  double get proteinRecommended => _proteinRecommended ?? 0.0;
  bool hasProteinRecommended() => _proteinRecommended != null;

  // "fat_recommended" field.
  double? _fatRecommended;
  double get fatRecommended => _fatRecommended ?? 0.0;
  bool hasFatRecommended() => _fatRecommended != null;

  // "carbs_recommended" field.
  double? _carbsRecommended;
  double get carbsRecommended => _carbsRecommended ?? 0.0;
  bool hasCarbsRecommended() => _carbsRecommended != null;

  // "sugar_recommended" field.
  double? _sugarRecommended;
  double get sugarRecommended => _sugarRecommended ?? 0.0;
  bool hasSugarRecommended() => _sugarRecommended != null;

  // "salt_recommended" field.
  double? _saltRecommended;
  double get saltRecommended => _saltRecommended ?? 0.0;
  bool hasSaltRecommended() => _saltRecommended != null;

  // "confirmed" field.
  bool? _confirmed;
  bool get confirmed => _confirmed ?? false;
  bool hasConfirmed() => _confirmed != null;

  // "event_datetime" field.
  DateTime? _eventDatetime;
  DateTime? get eventDatetime => _eventDatetime;
  bool hasEventDatetime() => _eventDatetime != null;

  // "type" field.
  MealType? _type;
  MealType? get type => _type;
  bool hasType() => _type != null;

  // "extra_goal_achieved" field.
  bool? _extraGoalAchieved;
  bool get extraGoalAchieved => _extraGoalAchieved ?? false;
  bool hasExtraGoalAchieved() => _extraGoalAchieved != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _weekNo = castToType<int>(snapshotData['week_no']);
    _weekStartDate = snapshotData['week_start_date'] as DateTime?;
    _weekdayNo = castToType<int>(snapshotData['weekday_no']);
    _weekday = snapshotData['weekday'] is Weekday
        ? snapshotData['weekday']
        : deserializeEnum<Weekday>(snapshotData['weekday']);
    _source = snapshotData['source'] as String?;
    _prompted = snapshotData['prompted'] as bool?;
    _name = snapshotData['name'] as String?;
    _portionSize = snapshotData['portion_size'] as String?;
    _portionSizeGrams = castToType<double>(snapshotData['portion_size_grams']);
    _category = getDataList(snapshotData['category']);
    _calories = castToType<double>(snapshotData['calories']);
    _fibreGrams = castToType<double>(snapshotData['fibre_grams']);
    _proteinGrams = castToType<double>(snapshotData['protein_grams']);
    _fatGrams = castToType<double>(snapshotData['fat_grams']);
    _carbsGrams = castToType<double>(snapshotData['carbs_grams']);
    _sugarGrams = castToType<double>(snapshotData['sugar_grams']);
    _saltGrams = castToType<double>(snapshotData['salt_grams']);
    _satiationLevel = snapshotData['satiation_level'] is Level
        ? snapshotData['satiation_level']
        : deserializeEnum<Level>(snapshotData['satiation_level']);
    _satisfactionLevel = snapshotData['satisfaction_level'] is Level
        ? snapshotData['satisfaction_level']
        : deserializeEnum<Level>(snapshotData['satisfaction_level']);
    _fibreRecommended = castToType<double>(snapshotData['fibre_recommended']);
    _proteinRecommended =
        castToType<double>(snapshotData['protein_recommended']);
    _fatRecommended = castToType<double>(snapshotData['fat_recommended']);
    _carbsRecommended = castToType<double>(snapshotData['carbs_recommended']);
    _sugarRecommended = castToType<double>(snapshotData['sugar_recommended']);
    _saltRecommended = castToType<double>(snapshotData['salt_recommended']);
    _confirmed = snapshotData['confirmed'] as bool?;
    _eventDatetime = snapshotData['event_datetime'] as DateTime?;
    _type = snapshotData['type'] is MealType
        ? snapshotData['type']
        : deserializeEnum<MealType>(snapshotData['type']);
    _extraGoalAchieved = snapshotData['extra_goal_achieved'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('food')
          : FirebaseFirestore.instance.collectionGroup('food');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('food').doc(id);

  static Stream<FoodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodRecord.fromSnapshot(s));

  static Future<FoodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodRecord.fromSnapshot(s));

  static FoodRecord fromSnapshot(DocumentSnapshot snapshot) => FoodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodRecordData({
  DateTime? createdAt,
  DateTime? eventDate,
  int? weekNo,
  DateTime? weekStartDate,
  int? weekdayNo,
  Weekday? weekday,
  String? source,
  bool? prompted,
  String? name,
  String? portionSize,
  double? portionSizeGrams,
  double? calories,
  double? fibreGrams,
  double? proteinGrams,
  double? fatGrams,
  double? carbsGrams,
  double? sugarGrams,
  double? saltGrams,
  Level? satiationLevel,
  Level? satisfactionLevel,
  double? fibreRecommended,
  double? proteinRecommended,
  double? fatRecommended,
  double? carbsRecommended,
  double? sugarRecommended,
  double? saltRecommended,
  bool? confirmed,
  DateTime? eventDatetime,
  MealType? type,
  bool? extraGoalAchieved,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'event_date': eventDate,
      'week_no': weekNo,
      'week_start_date': weekStartDate,
      'weekday_no': weekdayNo,
      'weekday': weekday,
      'source': source,
      'prompted': prompted,
      'name': name,
      'portion_size': portionSize,
      'portion_size_grams': portionSizeGrams,
      'calories': calories,
      'fibre_grams': fibreGrams,
      'protein_grams': proteinGrams,
      'fat_grams': fatGrams,
      'carbs_grams': carbsGrams,
      'sugar_grams': sugarGrams,
      'salt_grams': saltGrams,
      'satiation_level': satiationLevel,
      'satisfaction_level': satisfactionLevel,
      'fibre_recommended': fibreRecommended,
      'protein_recommended': proteinRecommended,
      'fat_recommended': fatRecommended,
      'carbs_recommended': carbsRecommended,
      'sugar_recommended': sugarRecommended,
      'salt_recommended': saltRecommended,
      'confirmed': confirmed,
      'event_datetime': eventDatetime,
      'type': type,
      'extra_goal_achieved': extraGoalAchieved,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodRecordDocumentEquality implements Equality<FoodRecord> {
  const FoodRecordDocumentEquality();

  @override
  bool equals(FoodRecord? e1, FoodRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.eventDate == e2?.eventDate &&
        e1?.weekNo == e2?.weekNo &&
        e1?.weekStartDate == e2?.weekStartDate &&
        e1?.weekdayNo == e2?.weekdayNo &&
        e1?.weekday == e2?.weekday &&
        e1?.source == e2?.source &&
        e1?.prompted == e2?.prompted &&
        e1?.name == e2?.name &&
        e1?.portionSize == e2?.portionSize &&
        e1?.portionSizeGrams == e2?.portionSizeGrams &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.calories == e2?.calories &&
        e1?.fibreGrams == e2?.fibreGrams &&
        e1?.proteinGrams == e2?.proteinGrams &&
        e1?.fatGrams == e2?.fatGrams &&
        e1?.carbsGrams == e2?.carbsGrams &&
        e1?.sugarGrams == e2?.sugarGrams &&
        e1?.saltGrams == e2?.saltGrams &&
        e1?.satiationLevel == e2?.satiationLevel &&
        e1?.satisfactionLevel == e2?.satisfactionLevel &&
        e1?.fibreRecommended == e2?.fibreRecommended &&
        e1?.proteinRecommended == e2?.proteinRecommended &&
        e1?.fatRecommended == e2?.fatRecommended &&
        e1?.carbsRecommended == e2?.carbsRecommended &&
        e1?.sugarRecommended == e2?.sugarRecommended &&
        e1?.saltRecommended == e2?.saltRecommended &&
        e1?.confirmed == e2?.confirmed &&
        e1?.eventDatetime == e2?.eventDatetime &&
        e1?.type == e2?.type &&
        e1?.extraGoalAchieved == e2?.extraGoalAchieved;
  }

  @override
  int hash(FoodRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.eventDate,
        e?.weekNo,
        e?.weekStartDate,
        e?.weekdayNo,
        e?.weekday,
        e?.source,
        e?.prompted,
        e?.name,
        e?.portionSize,
        e?.portionSizeGrams,
        e?.category,
        e?.calories,
        e?.fibreGrams,
        e?.proteinGrams,
        e?.fatGrams,
        e?.carbsGrams,
        e?.sugarGrams,
        e?.saltGrams,
        e?.satiationLevel,
        e?.satisfactionLevel,
        e?.fibreRecommended,
        e?.proteinRecommended,
        e?.fatRecommended,
        e?.carbsRecommended,
        e?.sugarRecommended,
        e?.saltRecommended,
        e?.confirmed,
        e?.eventDatetime,
        e?.type,
        e?.extraGoalAchieved
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodRecord;
}
