import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodRecord extends FirestoreRecord {
  MoodRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "mood" field.
  Mood? _mood;
  Mood? get mood => _mood;
  bool hasMood() => _mood != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _mood = snapshotData['mood'] is Mood
        ? snapshotData['mood']
        : deserializeEnum<Mood>(snapshotData['mood']);
    _notes = snapshotData['notes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('mood')
          : FirebaseFirestore.instance.collectionGroup('mood');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('mood').doc(id);

  static Stream<MoodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoodRecord.fromSnapshot(s));

  static Future<MoodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoodRecord.fromSnapshot(s));

  static MoodRecord fromSnapshot(DocumentSnapshot snapshot) => MoodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoodRecordData({
  DateTime? createdAt,
  Mood? mood,
  String? notes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'mood': mood,
      'notes': notes,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoodRecordDocumentEquality implements Equality<MoodRecord> {
  const MoodRecordDocumentEquality();

  @override
  bool equals(MoodRecord? e1, MoodRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.mood == e2?.mood &&
        e1?.notes == e2?.notes;
  }

  @override
  int hash(MoodRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.mood, e?.notes]);

  @override
  bool isValidKey(Object? o) => o is MoodRecord;
}
