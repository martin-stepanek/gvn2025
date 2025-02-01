import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealplanRecord extends FirestoreRecord {
  MealplanRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "prep_time_min" field.
  int? _prepTimeMin;
  int get prepTimeMin => _prepTimeMin ?? 0;
  bool hasPrepTimeMin() => _prepTimeMin != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "ingredients_single_string" field.
  String? _ingredientsSingleString;
  String get ingredientsSingleString => _ingredientsSingleString ?? '';
  bool hasIngredientsSingleString() => _ingredientsSingleString != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _calories = castToType<int>(snapshotData['calories']);
    _prepTimeMin = castToType<int>(snapshotData['prep_time_min']);
    _ingredients = getDataList(snapshotData['ingredients']);
    _ingredientsSingleString =
        snapshotData['ingredients_single_string'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('mealplan')
          : FirebaseFirestore.instance.collectionGroup('mealplan');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('mealplan').doc(id);

  static Stream<MealplanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealplanRecord.fromSnapshot(s));

  static Future<MealplanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealplanRecord.fromSnapshot(s));

  static MealplanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MealplanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealplanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealplanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealplanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealplanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealplanRecordData({
  DateTime? createdAt,
  String? name,
  int? calories,
  int? prepTimeMin,
  String? ingredientsSingleString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'name': name,
      'calories': calories,
      'prep_time_min': prepTimeMin,
      'ingredients_single_string': ingredientsSingleString,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealplanRecordDocumentEquality implements Equality<MealplanRecord> {
  const MealplanRecordDocumentEquality();

  @override
  bool equals(MealplanRecord? e1, MealplanRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.name == e2?.name &&
        e1?.calories == e2?.calories &&
        e1?.prepTimeMin == e2?.prepTimeMin &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        e1?.ingredientsSingleString == e2?.ingredientsSingleString;
  }

  @override
  int hash(MealplanRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.name,
        e?.calories,
        e?.prepTimeMin,
        e?.ingredients,
        e?.ingredientsSingleString
      ]);

  @override
  bool isValidKey(Object? o) => o is MealplanRecord;
}
