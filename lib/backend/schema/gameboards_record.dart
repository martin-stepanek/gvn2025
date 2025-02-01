import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameboardsRecord extends FirestoreRecord {
  GameboardsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "wins" field.
  int? _wins;
  int get wins => _wins ?? 0;
  bool hasWins() => _wins != null;

  // "tiles" field.
  List<DocumentReference>? _tiles;
  List<DocumentReference> get tiles => _tiles ?? const [];
  bool hasTiles() => _tiles != null;

  // "total_tries" field.
  int? _totalTries;
  int get totalTries => _totalTries ?? 0;
  bool hasTotalTries() => _totalTries != null;

  // "tries_used" field.
  int? _triesUsed;
  int get triesUsed => _triesUsed ?? 0;
  bool hasTriesUsed() => _triesUsed != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _wins = castToType<int>(snapshotData['wins']);
    _tiles = getDataList(snapshotData['tiles']);
    _totalTries = castToType<int>(snapshotData['total_tries']);
    _triesUsed = castToType<int>(snapshotData['tries_used']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gameboards');

  static Stream<GameboardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GameboardsRecord.fromSnapshot(s));

  static Future<GameboardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GameboardsRecord.fromSnapshot(s));

  static GameboardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GameboardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GameboardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GameboardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GameboardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GameboardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGameboardsRecordData({
  DateTime? createdAt,
  DocumentReference? user,
  int? wins,
  int? totalTries,
  int? triesUsed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user': user,
      'wins': wins,
      'total_tries': totalTries,
      'tries_used': triesUsed,
    }.withoutNulls,
  );

  return firestoreData;
}

class GameboardsRecordDocumentEquality implements Equality<GameboardsRecord> {
  const GameboardsRecordDocumentEquality();

  @override
  bool equals(GameboardsRecord? e1, GameboardsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.wins == e2?.wins &&
        listEquality.equals(e1?.tiles, e2?.tiles) &&
        e1?.totalTries == e2?.totalTries &&
        e1?.triesUsed == e2?.triesUsed;
  }

  @override
  int hash(GameboardsRecord? e) => const ListEquality().hash(
      [e?.createdAt, e?.user, e?.wins, e?.tiles, e?.totalTries, e?.triesUsed]);

  @override
  bool isValidKey(Object? o) => o is GameboardsRecord;
}
