import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PathwaysRecord extends FirestoreRecord {
  PathwaysRecord._(
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

  // "type" field.
  PathwayType? _type;
  PathwayType? get type => _type;
  bool hasType() => _type != null;

  // "actions" field.
  List<DocumentReference>? _actions;
  List<DocumentReference> get actions => _actions ?? const [];
  bool hasActions() => _actions != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] is PathwayType
        ? snapshotData['type']
        : deserializeEnum<PathwayType>(snapshotData['type']);
    _actions = getDataList(snapshotData['actions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pathways');

  static Stream<PathwaysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PathwaysRecord.fromSnapshot(s));

  static Future<PathwaysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PathwaysRecord.fromSnapshot(s));

  static PathwaysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PathwaysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PathwaysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PathwaysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PathwaysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PathwaysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPathwaysRecordData({
  DateTime? createdAt,
  String? name,
  PathwayType? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'name': name,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class PathwaysRecordDocumentEquality implements Equality<PathwaysRecord> {
  const PathwaysRecordDocumentEquality();

  @override
  bool equals(PathwaysRecord? e1, PathwaysRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.actions, e2?.actions);
  }

  @override
  int hash(PathwaysRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.name, e?.type, e?.actions]);

  @override
  bool isValidKey(Object? o) => o is PathwaysRecord;
}
