import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "category" field.
  CoachCategory? _category;
  CoachCategory? get category => _category;
  bool hasCategory() => _category != null;

  // "step" field.
  ProcessStep? _step;
  ProcessStep? get step => _step;
  bool hasStep() => _step != null;

  // "intent" field.
  String? _intent;
  String get intent => _intent ?? '';
  bool hasIntent() => _intent != null;

  // "suggestions" field.
  List<String>? _suggestions;
  List<String> get suggestions => _suggestions ?? const [];
  bool hasSuggestions() => _suggestions != null;

  // "newChat" field.
  bool? _newChat;
  bool get newChat => _newChat ?? false;
  bool hasNewChat() => _newChat != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _category = snapshotData['category'] is CoachCategory
        ? snapshotData['category']
        : deserializeEnum<CoachCategory>(snapshotData['category']);
    _step = snapshotData['step'] is ProcessStep
        ? snapshotData['step']
        : deserializeEnum<ProcessStep>(snapshotData['step']);
    _intent = snapshotData['intent'] as String?;
    _suggestions = getDataList(snapshotData['suggestions']);
    _newChat = snapshotData['newChat'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? userRef,
  DateTime? timestamp,
  String? title,
  CoachCategory? category,
  ProcessStep? step,
  String? intent,
  bool? newChat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'timestamp': timestamp,
      'title': title,
      'category': category,
      'step': step,
      'intent': intent,
      'newChat': newChat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.title == e2?.title &&
        e1?.category == e2?.category &&
        e1?.step == e2?.step &&
        e1?.intent == e2?.intent &&
        listEquality.equals(e1?.suggestions, e2?.suggestions) &&
        e1?.newChat == e2?.newChat;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.timestamp,
        e?.title,
        e?.category,
        e?.step,
        e?.intent,
        e?.suggestions,
        e?.newChat
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
