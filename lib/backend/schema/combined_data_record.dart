import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CombinedDataRecord extends FirestoreRecord {
  CombinedDataRecord._(
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

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "combined_data" field.
  CombinedDataStruct? _combinedData;
  CombinedDataStruct get combinedData => _combinedData ?? CombinedDataStruct();
  bool hasCombinedData() => _combinedData != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _source = snapshotData['source'] as String?;
    _combinedData = snapshotData['combined_data'] is CombinedDataStruct
        ? snapshotData['combined_data']
        : CombinedDataStruct.maybeFromMap(snapshotData['combined_data']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('combined_data')
          : FirebaseFirestore.instance.collectionGroup('combined_data');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('combined_data').doc(id);

  static Stream<CombinedDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CombinedDataRecord.fromSnapshot(s));

  static Future<CombinedDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CombinedDataRecord.fromSnapshot(s));

  static CombinedDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CombinedDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CombinedDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CombinedDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CombinedDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CombinedDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCombinedDataRecordData({
  DateTime? createdAt,
  DateTime? eventDate,
  String? source,
  CombinedDataStruct? combinedData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'event_date': eventDate,
      'source': source,
      'combined_data': CombinedDataStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "combined_data" field.
  addCombinedDataStructData(firestoreData, combinedData, 'combined_data');

  return firestoreData;
}

class CombinedDataRecordDocumentEquality
    implements Equality<CombinedDataRecord> {
  const CombinedDataRecordDocumentEquality();

  @override
  bool equals(CombinedDataRecord? e1, CombinedDataRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.eventDate == e2?.eventDate &&
        e1?.source == e2?.source &&
        e1?.combinedData == e2?.combinedData;
  }

  @override
  int hash(CombinedDataRecord? e) => const ListEquality()
      .hash([e?.createdAt, e?.eventDate, e?.source, e?.combinedData]);

  @override
  bool isValidKey(Object? o) => o is CombinedDataRecord;
}
