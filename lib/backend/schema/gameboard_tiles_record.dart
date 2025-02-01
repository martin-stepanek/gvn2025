import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameboardTilesRecord extends FirestoreRecord {
  GameboardTilesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "winning" field.
  bool? _winning;
  bool get winning => _winning ?? false;
  bool hasWinning() => _winning != null;

  // "reward" field.
  String? _reward;
  String get reward => _reward ?? '';
  bool hasReward() => _reward != null;

  // "reward_value" field.
  double? _rewardValue;
  double get rewardValue => _rewardValue ?? 0.0;
  bool hasRewardValue() => _rewardValue != null;

  // "turned" field.
  bool? _turned;
  bool get turned => _turned ?? false;
  bool hasTurned() => _turned != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _winning = snapshotData['winning'] as bool?;
    _reward = snapshotData['reward'] as String?;
    _rewardValue = castToType<double>(snapshotData['reward_value']);
    _turned = snapshotData['turned'] as bool?;
    _index = castToType<int>(snapshotData['index']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('gameboard_tiles')
          : FirebaseFirestore.instance.collectionGroup('gameboard_tiles');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('gameboard_tiles').doc(id);

  static Stream<GameboardTilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GameboardTilesRecord.fromSnapshot(s));

  static Future<GameboardTilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GameboardTilesRecord.fromSnapshot(s));

  static GameboardTilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GameboardTilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GameboardTilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GameboardTilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GameboardTilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GameboardTilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGameboardTilesRecordData({
  bool? winning,
  String? reward,
  double? rewardValue,
  bool? turned,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'winning': winning,
      'reward': reward,
      'reward_value': rewardValue,
      'turned': turned,
      'index': index,
    }.withoutNulls,
  );

  return firestoreData;
}

class GameboardTilesRecordDocumentEquality
    implements Equality<GameboardTilesRecord> {
  const GameboardTilesRecordDocumentEquality();

  @override
  bool equals(GameboardTilesRecord? e1, GameboardTilesRecord? e2) {
    return e1?.winning == e2?.winning &&
        e1?.reward == e2?.reward &&
        e1?.rewardValue == e2?.rewardValue &&
        e1?.turned == e2?.turned &&
        e1?.index == e2?.index;
  }

  @override
  int hash(GameboardTilesRecord? e) => const ListEquality()
      .hash([e?.winning, e?.reward, e?.rewardValue, e?.turned, e?.index]);

  @override
  bool isValidKey(Object? o) => o is GameboardTilesRecord;
}
