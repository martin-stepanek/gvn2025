import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NbaRecord extends FirestoreRecord {
  NbaRecord._(
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

  // "activity" field.
  bool? _activity;
  bool get activity => _activity ?? false;
  bool hasActivity() => _activity != null;

  // "healthy_action" field.
  bool? _healthyAction;
  bool get healthyAction => _healthyAction ?? false;
  bool hasHealthyAction() => _healthyAction != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "progress_int" field.
  int? _progressInt;
  int get progressInt => _progressInt ?? 0;
  bool hasProgressInt() => _progressInt != null;

  // "progress_int_total" field.
  int? _progressIntTotal;
  int get progressIntTotal => _progressIntTotal ?? 0;
  bool hasProgressIntTotal() => _progressIntTotal != null;

  // "progress_double" field.
  double? _progressDouble;
  double get progressDouble => _progressDouble ?? 0.0;
  bool hasProgressDouble() => _progressDouble != null;

  // "progress_int_bool" field.
  bool? _progressIntBool;
  bool get progressIntBool => _progressIntBool ?? false;
  bool hasProgressIntBool() => _progressIntBool != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  // "started_at" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  bool hasStartedAt() => _startedAt != null;

  // "completed_at" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  bool hasCompletedAt() => _completedAt != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "complete_by" field.
  DateTime? _completeBy;
  DateTime? get completeBy => _completeBy;
  bool hasCompleteBy() => _completeBy != null;

  // "importance" field.
  String? _importance;
  String get importance => _importance ?? '';
  bool hasImportance() => _importance != null;

  // "target_int" field.
  int? _targetInt;
  int get targetInt => _targetInt ?? 0;
  bool hasTargetInt() => _targetInt != null;

  // "target_food_type" field.
  MealType? _targetFoodType;
  MealType? get targetFoodType => _targetFoodType;
  bool hasTargetFoodType() => _targetFoodType != null;

  // "type" field.
  Nba? _type;
  Nba? get type => _type;
  bool hasType() => _type != null;

  // "target_int2" field.
  int? _targetInt2;
  int get targetInt2 => _targetInt2 ?? 0;
  bool hasTargetInt2() => _targetInt2 != null;

  // "target_double" field.
  double? _targetDouble;
  double get targetDouble => _targetDouble ?? 0.0;
  bool hasTargetDouble() => _targetDouble != null;

  // "target_double2" field.
  double? _targetDouble2;
  double get targetDouble2 => _targetDouble2 ?? 0.0;
  bool hasTargetDouble2() => _targetDouble2 != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  bool hasAvailable() => _available != null;

  // "type_name" field.
  String? _typeName;
  String get typeName => _typeName ?? '';
  bool hasTypeName() => _typeName != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _activity = snapshotData['activity'] as bool?;
    _healthyAction = snapshotData['healthy_action'] as bool?;
    _active = snapshotData['active'] as bool?;
    _progressInt = castToType<int>(snapshotData['progress_int']);
    _progressIntTotal = castToType<int>(snapshotData['progress_int_total']);
    _progressDouble = castToType<double>(snapshotData['progress_double']);
    _progressIntBool = snapshotData['progress_int_bool'] as bool?;
    _done = snapshotData['done'] as bool?;
    _startedAt = snapshotData['started_at'] as DateTime?;
    _completedAt = snapshotData['completed_at'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _completeBy = snapshotData['complete_by'] as DateTime?;
    _importance = snapshotData['importance'] as String?;
    _targetInt = castToType<int>(snapshotData['target_int']);
    _targetFoodType = snapshotData['target_food_type'] is MealType
        ? snapshotData['target_food_type']
        : deserializeEnum<MealType>(snapshotData['target_food_type']);
    _type = snapshotData['type'] is Nba
        ? snapshotData['type']
        : deserializeEnum<Nba>(snapshotData['type']);
    _targetInt2 = castToType<int>(snapshotData['target_int2']);
    _targetDouble = castToType<double>(snapshotData['target_double']);
    _targetDouble2 = castToType<double>(snapshotData['target_double2']);
    _id = snapshotData['id'] as String?;
    _available = snapshotData['available'] as bool?;
    _typeName = snapshotData['type_name'] as String?;
    _notes = snapshotData['notes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('nba')
          : FirebaseFirestore.instance.collectionGroup('nba');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('nba').doc(id);

  static Stream<NbaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NbaRecord.fromSnapshot(s));

  static Future<NbaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NbaRecord.fromSnapshot(s));

  static NbaRecord fromSnapshot(DocumentSnapshot snapshot) => NbaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NbaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NbaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NbaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NbaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNbaRecordData({
  DateTime? createdAt,
  String? name,
  bool? activity,
  bool? healthyAction,
  bool? active,
  int? progressInt,
  int? progressIntTotal,
  double? progressDouble,
  bool? progressIntBool,
  bool? done,
  DateTime? startedAt,
  DateTime? completedAt,
  String? description,
  DateTime? completeBy,
  String? importance,
  int? targetInt,
  MealType? targetFoodType,
  Nba? type,
  int? targetInt2,
  double? targetDouble,
  double? targetDouble2,
  String? id,
  bool? available,
  String? typeName,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'name': name,
      'activity': activity,
      'healthy_action': healthyAction,
      'active': active,
      'progress_int': progressInt,
      'progress_int_total': progressIntTotal,
      'progress_double': progressDouble,
      'progress_int_bool': progressIntBool,
      'done': done,
      'started_at': startedAt,
      'completed_at': completedAt,
      'description': description,
      'complete_by': completeBy,
      'importance': importance,
      'target_int': targetInt,
      'target_food_type': targetFoodType,
      'type': type,
      'target_int2': targetInt2,
      'target_double': targetDouble,
      'target_double2': targetDouble2,
      'id': id,
      'available': available,
      'type_name': typeName,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class NbaRecordDocumentEquality implements Equality<NbaRecord> {
  const NbaRecordDocumentEquality();

  @override
  bool equals(NbaRecord? e1, NbaRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.name == e2?.name &&
        e1?.activity == e2?.activity &&
        e1?.healthyAction == e2?.healthyAction &&
        e1?.active == e2?.active &&
        e1?.progressInt == e2?.progressInt &&
        e1?.progressIntTotal == e2?.progressIntTotal &&
        e1?.progressDouble == e2?.progressDouble &&
        e1?.progressIntBool == e2?.progressIntBool &&
        e1?.done == e2?.done &&
        e1?.startedAt == e2?.startedAt &&
        e1?.completedAt == e2?.completedAt &&
        e1?.description == e2?.description &&
        e1?.completeBy == e2?.completeBy &&
        e1?.importance == e2?.importance &&
        e1?.targetInt == e2?.targetInt &&
        e1?.targetFoodType == e2?.targetFoodType &&
        e1?.type == e2?.type &&
        e1?.targetInt2 == e2?.targetInt2 &&
        e1?.targetDouble == e2?.targetDouble &&
        e1?.targetDouble2 == e2?.targetDouble2 &&
        e1?.id == e2?.id &&
        e1?.available == e2?.available &&
        e1?.typeName == e2?.typeName &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(NbaRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.name,
        e?.activity,
        e?.healthyAction,
        e?.active,
        e?.progressInt,
        e?.progressIntTotal,
        e?.progressDouble,
        e?.progressIntBool,
        e?.done,
        e?.startedAt,
        e?.completedAt,
        e?.description,
        e?.completeBy,
        e?.importance,
        e?.targetInt,
        e?.targetFoodType,
        e?.type,
        e?.targetInt2,
        e?.targetDouble,
        e?.targetDouble2,
        e?.id,
        e?.available,
        e?.typeName,
        e?.notes
      ]);

  @override
  bool isValidKey(Object? o) => o is NbaRecord;
}
