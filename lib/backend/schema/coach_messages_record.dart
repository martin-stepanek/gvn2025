import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoachMessagesRecord extends FirestoreRecord {
  CoachMessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "show_from" field.
  DateTime? _showFrom;
  DateTime? get showFrom => _showFrom;
  bool hasShowFrom() => _showFrom != null;

  // "show_until" field.
  DateTime? _showUntil;
  DateTime? get showUntil => _showUntil;
  bool hasShowUntil() => _showUntil != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "assessment" field.
  String? _assessment;
  String get assessment => _assessment ?? '';
  bool hasAssessment() => _assessment != null;

  // "extra_goal" field.
  String? _extraGoal;
  String get extraGoal => _extraGoal ?? '';
  bool hasExtraGoal() => _extraGoal != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _link = snapshotData['link'] as String?;
    _showFrom = snapshotData['show_from'] as DateTime?;
    _showUntil = snapshotData['show_until'] as DateTime?;
    _show = snapshotData['show'] as bool?;
    _assessment = snapshotData['assessment'] as String?;
    _extraGoal = snapshotData['extra_goal'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('coach_messages')
          : FirebaseFirestore.instance.collectionGroup('coach_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('coach_messages').doc(id);

  static Stream<CoachMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoachMessagesRecord.fromSnapshot(s));

  static Future<CoachMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoachMessagesRecord.fromSnapshot(s));

  static CoachMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoachMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoachMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoachMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoachMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoachMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoachMessagesRecordData({
  DateTime? createdAt,
  String? title,
  String? text,
  String? link,
  DateTime? showFrom,
  DateTime? showUntil,
  bool? show,
  String? assessment,
  String? extraGoal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'title': title,
      'text': text,
      'link': link,
      'show_from': showFrom,
      'show_until': showUntil,
      'show': show,
      'assessment': assessment,
      'extra_goal': extraGoal,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoachMessagesRecordDocumentEquality
    implements Equality<CoachMessagesRecord> {
  const CoachMessagesRecordDocumentEquality();

  @override
  bool equals(CoachMessagesRecord? e1, CoachMessagesRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.link == e2?.link &&
        e1?.showFrom == e2?.showFrom &&
        e1?.showUntil == e2?.showUntil &&
        e1?.show == e2?.show &&
        e1?.assessment == e2?.assessment &&
        e1?.extraGoal == e2?.extraGoal;
  }

  @override
  int hash(CoachMessagesRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.title,
        e?.text,
        e?.link,
        e?.showFrom,
        e?.showUntil,
        e?.show,
        e?.assessment,
        e?.extraGoal
      ]);

  @override
  bool isValidKey(Object? o) => o is CoachMessagesRecord;
}
