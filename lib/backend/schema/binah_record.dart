import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BinahRecord extends FirestoreRecord {
  BinahRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "hr" field.
  int? _hr;
  int get hr => _hr ?? 0;
  bool hasHr() => _hr != null;

  // "spo2" field.
  int? _spo2;
  int get spo2 => _spo2 ?? 0;
  bool hasSpo2() => _spo2 != null;

  // "br" field.
  int? _br;
  int get br => _br ?? 0;
  bool hasBr() => _br != null;

  // "sdnn" field.
  int? _sdnn;
  int get sdnn => _sdnn ?? 0;
  bool hasSdnn() => _sdnn != null;

  // "sl" field.
  int? _sl;
  int get sl => _sl ?? 0;
  bool hasSl() => _sl != null;

  // "bp" field.
  String? _bp;
  String get bp => _bp ?? '';
  bool hasBp() => _bp != null;

  // "a1c" field.
  double? _a1c;
  double get a1c => _a1c ?? 0.0;
  bool hasA1c() => _a1c != null;

  // "stressIndex" field.
  int? _stressIndex;
  int get stressIndex => _stressIndex ?? 0;
  bool hasStressIndex() => _stressIndex != null;

  // "meanRri" field.
  int? _meanRri;
  int get meanRri => _meanRri ?? 0;
  bool hasMeanRri() => _meanRri != null;

  // "rmssd" field.
  int? _rmssd;
  int get rmssd => _rmssd ?? 0;
  bool hasRmssd() => _rmssd != null;

  // "sd1" field.
  int? _sd1;
  int get sd1 => _sd1 ?? 0;
  bool hasSd1() => _sd1 != null;

  // "sd2" field.
  int? _sd2;
  int get sd2 => _sd2 ?? 0;
  bool hasSd2() => _sd2 != null;

  // "wellnessIndex" field.
  int? _wellnessIndex;
  int get wellnessIndex => _wellnessIndex ?? 0;
  bool hasWellnessIndex() => _wellnessIndex != null;

  // "wellnessLevel" field.
  int? _wellnessLevel;
  int get wellnessLevel => _wellnessLevel ?? 0;
  bool hasWellnessLevel() => _wellnessLevel != null;

  // "pnsZone" field.
  int? _pnsZone;
  int get pnsZone => _pnsZone ?? 0;
  bool hasPnsZone() => _pnsZone != null;

  // "snsIndex" field.
  double? _snsIndex;
  double get snsIndex => _snsIndex ?? 0.0;
  bool hasSnsIndex() => _snsIndex != null;

  // "pnsIndex" field.
  double? _pnsIndex;
  double get pnsIndex => _pnsIndex ?? 0.0;
  bool hasPnsIndex() => _pnsIndex != null;

  // "snsZone" field.
  int? _snsZone;
  int get snsZone => _snsZone ?? 0;
  bool hasSnsZone() => _snsZone != null;

  // "prq" field.
  double? _prq;
  double get prq => _prq ?? 0.0;
  bool hasPrq() => _prq != null;

  // "lfhf" field.
  double? _lfhf;
  double get lfhf => _lfhf ?? 0.0;
  bool hasLfhf() => _lfhf != null;

  // "hemoglobin" field.
  double? _hemoglobin;
  double get hemoglobin => _hemoglobin ?? 0.0;
  bool hasHemoglobin() => _hemoglobin != null;

  // "heartRateConfidence" field.
  String? _heartRateConfidence;
  String get heartRateConfidence => _heartRateConfidence ?? '';
  bool hasHeartRateConfidence() => _heartRateConfidence != null;

  // "breathingRateConfidence" field.
  String? _breathingRateConfidence;
  String get breathingRateConfidence => _breathingRateConfidence ?? '';
  bool hasBreathingRateConfidence() => _breathingRateConfidence != null;

  // "sdnnConfidence" field.
  String? _sdnnConfidence;
  String get sdnnConfidence => _sdnnConfidence ?? '';
  bool hasSdnnConfidence() => _sdnnConfidence != null;

  // "rriConfidence" field.
  String? _rriConfidence;
  String get rriConfidence => _rriConfidence ?? '';
  bool hasRriConfidence() => _rriConfidence != null;

  // "meanRriConfidence" field.
  String? _meanRriConfidence;
  String get meanRriConfidence => _meanRriConfidence ?? '';
  bool hasMeanRriConfidence() => _meanRriConfidence != null;

  // "prqConfidence" field.
  String? _prqConfidence;
  String get prqConfidence => _prqConfidence ?? '';
  bool hasPrqConfidence() => _prqConfidence != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _hr = castToType<int>(snapshotData['hr']);
    _spo2 = castToType<int>(snapshotData['spo2']);
    _br = castToType<int>(snapshotData['br']);
    _sdnn = castToType<int>(snapshotData['sdnn']);
    _sl = castToType<int>(snapshotData['sl']);
    _bp = snapshotData['bp'] as String?;
    _a1c = castToType<double>(snapshotData['a1c']);
    _stressIndex = castToType<int>(snapshotData['stressIndex']);
    _meanRri = castToType<int>(snapshotData['meanRri']);
    _rmssd = castToType<int>(snapshotData['rmssd']);
    _sd1 = castToType<int>(snapshotData['sd1']);
    _sd2 = castToType<int>(snapshotData['sd2']);
    _wellnessIndex = castToType<int>(snapshotData['wellnessIndex']);
    _wellnessLevel = castToType<int>(snapshotData['wellnessLevel']);
    _pnsZone = castToType<int>(snapshotData['pnsZone']);
    _snsIndex = castToType<double>(snapshotData['snsIndex']);
    _pnsIndex = castToType<double>(snapshotData['pnsIndex']);
    _snsZone = castToType<int>(snapshotData['snsZone']);
    _prq = castToType<double>(snapshotData['prq']);
    _lfhf = castToType<double>(snapshotData['lfhf']);
    _hemoglobin = castToType<double>(snapshotData['hemoglobin']);
    _heartRateConfidence = snapshotData['heartRateConfidence'] as String?;
    _breathingRateConfidence =
        snapshotData['breathingRateConfidence'] as String?;
    _sdnnConfidence = snapshotData['sdnnConfidence'] as String?;
    _rriConfidence = snapshotData['rriConfidence'] as String?;
    _meanRriConfidence = snapshotData['meanRriConfidence'] as String?;
    _prqConfidence = snapshotData['prqConfidence'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('binah')
          : FirebaseFirestore.instance.collectionGroup('binah');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('binah').doc(id);

  static Stream<BinahRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BinahRecord.fromSnapshot(s));

  static Future<BinahRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BinahRecord.fromSnapshot(s));

  static BinahRecord fromSnapshot(DocumentSnapshot snapshot) => BinahRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BinahRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BinahRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BinahRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BinahRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBinahRecordData({
  DateTime? createdAt,
  int? hr,
  int? spo2,
  int? br,
  int? sdnn,
  int? sl,
  String? bp,
  double? a1c,
  int? stressIndex,
  int? meanRri,
  int? rmssd,
  int? sd1,
  int? sd2,
  int? wellnessIndex,
  int? wellnessLevel,
  int? pnsZone,
  double? snsIndex,
  double? pnsIndex,
  int? snsZone,
  double? prq,
  double? lfhf,
  double? hemoglobin,
  String? heartRateConfidence,
  String? breathingRateConfidence,
  String? sdnnConfidence,
  String? rriConfidence,
  String? meanRriConfidence,
  String? prqConfidence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'hr': hr,
      'spo2': spo2,
      'br': br,
      'sdnn': sdnn,
      'sl': sl,
      'bp': bp,
      'a1c': a1c,
      'stressIndex': stressIndex,
      'meanRri': meanRri,
      'rmssd': rmssd,
      'sd1': sd1,
      'sd2': sd2,
      'wellnessIndex': wellnessIndex,
      'wellnessLevel': wellnessLevel,
      'pnsZone': pnsZone,
      'snsIndex': snsIndex,
      'pnsIndex': pnsIndex,
      'snsZone': snsZone,
      'prq': prq,
      'lfhf': lfhf,
      'hemoglobin': hemoglobin,
      'heartRateConfidence': heartRateConfidence,
      'breathingRateConfidence': breathingRateConfidence,
      'sdnnConfidence': sdnnConfidence,
      'rriConfidence': rriConfidence,
      'meanRriConfidence': meanRriConfidence,
      'prqConfidence': prqConfidence,
    }.withoutNulls,
  );

  return firestoreData;
}

class BinahRecordDocumentEquality implements Equality<BinahRecord> {
  const BinahRecordDocumentEquality();

  @override
  bool equals(BinahRecord? e1, BinahRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.hr == e2?.hr &&
        e1?.spo2 == e2?.spo2 &&
        e1?.br == e2?.br &&
        e1?.sdnn == e2?.sdnn &&
        e1?.sl == e2?.sl &&
        e1?.bp == e2?.bp &&
        e1?.a1c == e2?.a1c &&
        e1?.stressIndex == e2?.stressIndex &&
        e1?.meanRri == e2?.meanRri &&
        e1?.rmssd == e2?.rmssd &&
        e1?.sd1 == e2?.sd1 &&
        e1?.sd2 == e2?.sd2 &&
        e1?.wellnessIndex == e2?.wellnessIndex &&
        e1?.wellnessLevel == e2?.wellnessLevel &&
        e1?.pnsZone == e2?.pnsZone &&
        e1?.snsIndex == e2?.snsIndex &&
        e1?.pnsIndex == e2?.pnsIndex &&
        e1?.snsZone == e2?.snsZone &&
        e1?.prq == e2?.prq &&
        e1?.lfhf == e2?.lfhf &&
        e1?.hemoglobin == e2?.hemoglobin &&
        e1?.heartRateConfidence == e2?.heartRateConfidence &&
        e1?.breathingRateConfidence == e2?.breathingRateConfidence &&
        e1?.sdnnConfidence == e2?.sdnnConfidence &&
        e1?.rriConfidence == e2?.rriConfidence &&
        e1?.meanRriConfidence == e2?.meanRriConfidence &&
        e1?.prqConfidence == e2?.prqConfidence;
  }

  @override
  int hash(BinahRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.hr,
        e?.spo2,
        e?.br,
        e?.sdnn,
        e?.sl,
        e?.bp,
        e?.a1c,
        e?.stressIndex,
        e?.meanRri,
        e?.rmssd,
        e?.sd1,
        e?.sd2,
        e?.wellnessIndex,
        e?.wellnessLevel,
        e?.pnsZone,
        e?.snsIndex,
        e?.pnsIndex,
        e?.snsZone,
        e?.prq,
        e?.lfhf,
        e?.hemoglobin,
        e?.heartRateConfidence,
        e?.breathingRateConfidence,
        e?.sdnnConfidence,
        e?.rriConfidence,
        e?.meanRriConfidence,
        e?.prqConfidence
      ]);

  @override
  bool isValidKey(Object? o) => o is BinahRecord;
}
