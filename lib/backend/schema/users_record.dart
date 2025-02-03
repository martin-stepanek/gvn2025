import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "os" field.
  String? _os;
  String get os => _os ?? '';
  bool hasOs() => _os != null;

  // "timezone_offset" field.
  int? _timezoneOffset;
  int get timezoneOffset => _timezoneOffset ?? 0;
  bool hasTimezoneOffset() => _timezoneOffset != null;

  // "onboarding_complete" field.
  bool? _onboardingComplete;
  bool get onboardingComplete => _onboardingComplete ?? false;
  bool hasOnboardingComplete() => _onboardingComplete != null;

  // "progress" field.
  Progress? _progress;
  Progress? get progress => _progress;
  bool hasProgress() => _progress != null;

  // "app_version" field.
  int? _appVersion;
  int get appVersion => _appVersion ?? 0;
  bool hasAppVersion() => _appVersion != null;

  // "rewards_available" field.
  int? _rewardsAvailable;
  int get rewardsAvailable => _rewardsAvailable ?? 0;
  bool hasRewardsAvailable() => _rewardsAvailable != null;

  // "speech_link" field.
  String? _speechLink;
  String get speechLink => _speechLink ?? '';
  bool hasSpeechLink() => _speechLink != null;

  // "last_chat" field.
  DocumentReference? _lastChat;
  DocumentReference? get lastChat => _lastChat;
  bool hasLastChat() => _lastChat != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _os = snapshotData['os'] as String?;
    _timezoneOffset = castToType<int>(snapshotData['timezone_offset']);
    _onboardingComplete = snapshotData['onboarding_complete'] as bool?;
    _progress = snapshotData['progress'] is Progress
        ? snapshotData['progress']
        : deserializeEnum<Progress>(snapshotData['progress']);
    _appVersion = castToType<int>(snapshotData['app_version']);
    _rewardsAvailable = castToType<int>(snapshotData['rewards_available']);
    _speechLink = snapshotData['speech_link'] as String?;
    _lastChat = snapshotData['last_chat'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? os,
  int? timezoneOffset,
  bool? onboardingComplete,
  Progress? progress,
  int? appVersion,
  int? rewardsAvailable,
  String? speechLink,
  DocumentReference? lastChat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'os': os,
      'timezone_offset': timezoneOffset,
      'onboarding_complete': onboardingComplete,
      'progress': progress,
      'app_version': appVersion,
      'rewards_available': rewardsAvailable,
      'speech_link': speechLink,
      'last_chat': lastChat,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.os == e2?.os &&
        e1?.timezoneOffset == e2?.timezoneOffset &&
        e1?.onboardingComplete == e2?.onboardingComplete &&
        e1?.progress == e2?.progress &&
        e1?.appVersion == e2?.appVersion &&
        e1?.rewardsAvailable == e2?.rewardsAvailable &&
        e1?.speechLink == e2?.speechLink &&
        e1?.lastChat == e2?.lastChat;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.os,
        e?.timezoneOffset,
        e?.onboardingComplete,
        e?.progress,
        e?.appVersion,
        e?.rewardsAvailable,
        e?.speechLink,
        e?.lastChat
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
