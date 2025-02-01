import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "type" field.
  NotificationType? _type;
  NotificationType? get type => _type;
  bool hasType() => _type != null;

  // "time" field.
  NotificationTime? _time;
  NotificationTime? get time => _time;
  bool hasTime() => _time != null;

  // "framing" field.
  NotificationFraming? _framing;
  NotificationFraming? get framing => _framing;
  bool hasFraming() => _framing != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "response" field.
  NotificationResponse? _response;
  NotificationResponse? get response => _response;
  bool hasResponse() => _response != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _type = snapshotData['type'] is NotificationType
        ? snapshotData['type']
        : deserializeEnum<NotificationType>(snapshotData['type']);
    _time = snapshotData['time'] is NotificationTime
        ? snapshotData['time']
        : deserializeEnum<NotificationTime>(snapshotData['time']);
    _framing = snapshotData['framing'] is NotificationFraming
        ? snapshotData['framing']
        : deserializeEnum<NotificationFraming>(snapshotData['framing']);
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _response = snapshotData['response'] is NotificationResponse
        ? snapshotData['response']
        : deserializeEnum<NotificationResponse>(snapshotData['response']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notifications')
          : FirebaseFirestore.instance.collectionGroup('notifications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notifications').doc(id);

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DateTime? createdAt,
  NotificationType? type,
  NotificationTime? time,
  NotificationFraming? framing,
  String? title,
  String? text,
  NotificationResponse? response,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'type': type,
      'time': time,
      'framing': framing,
      'title': title,
      'text': text,
      'response': response,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.type == e2?.type &&
        e1?.time == e2?.time &&
        e1?.framing == e2?.framing &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.response == e2?.response;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.type,
        e?.time,
        e?.framing,
        e?.title,
        e?.text,
        e?.response
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
