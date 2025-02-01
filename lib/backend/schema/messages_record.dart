import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "firstMessage" field.
  bool? _firstMessage;
  bool get firstMessage => _firstMessage ?? false;
  bool hasFirstMessage() => _firstMessage != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "include" field.
  bool? _include;
  bool get include => _include ?? false;
  bool hasInclude() => _include != null;

  // "seconds_to_generate" field.
  double? _secondsToGenerate;
  double get secondsToGenerate => _secondsToGenerate ?? 0.0;
  bool hasSecondsToGenerate() => _secondsToGenerate != null;

  // "cost_usd" field.
  double? _costUsd;
  double get costUsd => _costUsd ?? 0.0;
  bool hasCostUsd() => _costUsd != null;

  // "tokens_total" field.
  int? _tokensTotal;
  int get tokensTotal => _tokensTotal ?? 0;
  bool hasTokensTotal() => _tokensTotal != null;

  // "tokens_prompt" field.
  int? _tokensPrompt;
  int get tokensPrompt => _tokensPrompt ?? 0;
  bool hasTokensPrompt() => _tokensPrompt != null;

  // "tokens_response" field.
  int? _tokensResponse;
  int get tokensResponse => _tokensResponse ?? 0;
  bool hasTokensResponse() => _tokensResponse != null;

  // "user" field.
  User? _user;
  User? get user => _user;
  bool hasUser() => _user != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _firstMessage = snapshotData['firstMessage'] as bool?;
    _message = snapshotData['message'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _include = snapshotData['include'] as bool?;
    _secondsToGenerate =
        castToType<double>(snapshotData['seconds_to_generate']);
    _costUsd = castToType<double>(snapshotData['cost_usd']);
    _tokensTotal = castToType<int>(snapshotData['tokens_total']);
    _tokensPrompt = castToType<int>(snapshotData['tokens_prompt']);
    _tokensResponse = castToType<int>(snapshotData['tokens_response']);
    _user = snapshotData['user'] is User
        ? snapshotData['user']
        : deserializeEnum<User>(snapshotData['user']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DateTime? timestamp,
  bool? firstMessage,
  String? message,
  DocumentReference? userRef,
  bool? include,
  double? secondsToGenerate,
  double? costUsd,
  int? tokensTotal,
  int? tokensPrompt,
  int? tokensResponse,
  User? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'firstMessage': firstMessage,
      'message': message,
      'userRef': userRef,
      'include': include,
      'seconds_to_generate': secondsToGenerate,
      'cost_usd': costUsd,
      'tokens_total': tokensTotal,
      'tokens_prompt': tokensPrompt,
      'tokens_response': tokensResponse,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.firstMessage == e2?.firstMessage &&
        e1?.message == e2?.message &&
        e1?.userRef == e2?.userRef &&
        e1?.include == e2?.include &&
        e1?.secondsToGenerate == e2?.secondsToGenerate &&
        e1?.costUsd == e2?.costUsd &&
        e1?.tokensTotal == e2?.tokensTotal &&
        e1?.tokensPrompt == e2?.tokensPrompt &&
        e1?.tokensResponse == e2?.tokensResponse &&
        e1?.user == e2?.user;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.firstMessage,
        e?.message,
        e?.userRef,
        e?.include,
        e?.secondsToGenerate,
        e?.costUsd,
        e?.tokensTotal,
        e?.tokensPrompt,
        e?.tokensResponse,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
