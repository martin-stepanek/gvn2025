// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NbaStruct extends FFFirebaseStruct {
  NbaStruct({
    String? name,
    bool? activity,
    bool? healthyAction,
    int? progressIntTotal,
    bool? progressIntBool,
    String? description,
    String? importance,
    Nba? type,
    int? targetInt,
    MealType? targetFoodType,
    String? id,
    double? targetDouble,
    double? targetDouble2,
    int? targetInt2,
    String? typeName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _activity = activity,
        _healthyAction = healthyAction,
        _progressIntTotal = progressIntTotal,
        _progressIntBool = progressIntBool,
        _description = description,
        _importance = importance,
        _type = type,
        _targetInt = targetInt,
        _targetFoodType = targetFoodType,
        _id = id,
        _targetDouble = targetDouble,
        _targetDouble2 = targetDouble2,
        _targetInt2 = targetInt2,
        _typeName = typeName,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "activity" field.
  bool? _activity;
  bool get activity => _activity ?? false;
  set activity(bool? val) => _activity = val;

  bool hasActivity() => _activity != null;

  // "healthy_action" field.
  bool? _healthyAction;
  bool get healthyAction => _healthyAction ?? false;
  set healthyAction(bool? val) => _healthyAction = val;

  bool hasHealthyAction() => _healthyAction != null;

  // "progress_int_total" field.
  int? _progressIntTotal;
  int get progressIntTotal => _progressIntTotal ?? 0;
  set progressIntTotal(int? val) => _progressIntTotal = val;

  void incrementProgressIntTotal(int amount) =>
      progressIntTotal = progressIntTotal + amount;

  bool hasProgressIntTotal() => _progressIntTotal != null;

  // "progress_int_bool" field.
  bool? _progressIntBool;
  bool get progressIntBool => _progressIntBool ?? false;
  set progressIntBool(bool? val) => _progressIntBool = val;

  bool hasProgressIntBool() => _progressIntBool != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "importance" field.
  String? _importance;
  String get importance => _importance ?? '';
  set importance(String? val) => _importance = val;

  bool hasImportance() => _importance != null;

  // "type" field.
  Nba? _type;
  Nba? get type => _type;
  set type(Nba? val) => _type = val;

  bool hasType() => _type != null;

  // "target_int" field.
  int? _targetInt;
  int get targetInt => _targetInt ?? 0;
  set targetInt(int? val) => _targetInt = val;

  void incrementTargetInt(int amount) => targetInt = targetInt + amount;

  bool hasTargetInt() => _targetInt != null;

  // "target_food_type" field.
  MealType? _targetFoodType;
  MealType? get targetFoodType => _targetFoodType;
  set targetFoodType(MealType? val) => _targetFoodType = val;

  bool hasTargetFoodType() => _targetFoodType != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "target_double" field.
  double? _targetDouble;
  double get targetDouble => _targetDouble ?? 0.0;
  set targetDouble(double? val) => _targetDouble = val;

  void incrementTargetDouble(double amount) =>
      targetDouble = targetDouble + amount;

  bool hasTargetDouble() => _targetDouble != null;

  // "target_double2" field.
  double? _targetDouble2;
  double get targetDouble2 => _targetDouble2 ?? 0.0;
  set targetDouble2(double? val) => _targetDouble2 = val;

  void incrementTargetDouble2(double amount) =>
      targetDouble2 = targetDouble2 + amount;

  bool hasTargetDouble2() => _targetDouble2 != null;

  // "target_int2" field.
  int? _targetInt2;
  int get targetInt2 => _targetInt2 ?? 0;
  set targetInt2(int? val) => _targetInt2 = val;

  void incrementTargetInt2(int amount) => targetInt2 = targetInt2 + amount;

  bool hasTargetInt2() => _targetInt2 != null;

  // "type_name" field.
  String? _typeName;
  String get typeName => _typeName ?? '';
  set typeName(String? val) => _typeName = val;

  bool hasTypeName() => _typeName != null;

  static NbaStruct fromMap(Map<String, dynamic> data) => NbaStruct(
        name: data['name'] as String?,
        activity: data['activity'] as bool?,
        healthyAction: data['healthy_action'] as bool?,
        progressIntTotal: castToType<int>(data['progress_int_total']),
        progressIntBool: data['progress_int_bool'] as bool?,
        description: data['description'] as String?,
        importance: data['importance'] as String?,
        type: data['type'] is Nba
            ? data['type']
            : deserializeEnum<Nba>(data['type']),
        targetInt: castToType<int>(data['target_int']),
        targetFoodType: data['target_food_type'] is MealType
            ? data['target_food_type']
            : deserializeEnum<MealType>(data['target_food_type']),
        id: data['id'] as String?,
        targetDouble: castToType<double>(data['target_double']),
        targetDouble2: castToType<double>(data['target_double2']),
        targetInt2: castToType<int>(data['target_int2']),
        typeName: data['type_name'] as String?,
      );

  static NbaStruct? maybeFromMap(dynamic data) =>
      data is Map ? NbaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'activity': _activity,
        'healthy_action': _healthyAction,
        'progress_int_total': _progressIntTotal,
        'progress_int_bool': _progressIntBool,
        'description': _description,
        'importance': _importance,
        'type': _type?.serialize(),
        'target_int': _targetInt,
        'target_food_type': _targetFoodType?.serialize(),
        'id': _id,
        'target_double': _targetDouble,
        'target_double2': _targetDouble2,
        'target_int2': _targetInt2,
        'type_name': _typeName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'activity': serializeParam(
          _activity,
          ParamType.bool,
        ),
        'healthy_action': serializeParam(
          _healthyAction,
          ParamType.bool,
        ),
        'progress_int_total': serializeParam(
          _progressIntTotal,
          ParamType.int,
        ),
        'progress_int_bool': serializeParam(
          _progressIntBool,
          ParamType.bool,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'importance': serializeParam(
          _importance,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'target_int': serializeParam(
          _targetInt,
          ParamType.int,
        ),
        'target_food_type': serializeParam(
          _targetFoodType,
          ParamType.Enum,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'target_double': serializeParam(
          _targetDouble,
          ParamType.double,
        ),
        'target_double2': serializeParam(
          _targetDouble2,
          ParamType.double,
        ),
        'target_int2': serializeParam(
          _targetInt2,
          ParamType.int,
        ),
        'type_name': serializeParam(
          _typeName,
          ParamType.String,
        ),
      }.withoutNulls;

  static NbaStruct fromSerializableMap(Map<String, dynamic> data) => NbaStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        activity: deserializeParam(
          data['activity'],
          ParamType.bool,
          false,
        ),
        healthyAction: deserializeParam(
          data['healthy_action'],
          ParamType.bool,
          false,
        ),
        progressIntTotal: deserializeParam(
          data['progress_int_total'],
          ParamType.int,
          false,
        ),
        progressIntBool: deserializeParam(
          data['progress_int_bool'],
          ParamType.bool,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        importance: deserializeParam(
          data['importance'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<Nba>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        targetInt: deserializeParam(
          data['target_int'],
          ParamType.int,
          false,
        ),
        targetFoodType: deserializeParam<MealType>(
          data['target_food_type'],
          ParamType.Enum,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        targetDouble: deserializeParam(
          data['target_double'],
          ParamType.double,
          false,
        ),
        targetDouble2: deserializeParam(
          data['target_double2'],
          ParamType.double,
          false,
        ),
        targetInt2: deserializeParam(
          data['target_int2'],
          ParamType.int,
          false,
        ),
        typeName: deserializeParam(
          data['type_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NbaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NbaStruct &&
        name == other.name &&
        activity == other.activity &&
        healthyAction == other.healthyAction &&
        progressIntTotal == other.progressIntTotal &&
        progressIntBool == other.progressIntBool &&
        description == other.description &&
        importance == other.importance &&
        type == other.type &&
        targetInt == other.targetInt &&
        targetFoodType == other.targetFoodType &&
        id == other.id &&
        targetDouble == other.targetDouble &&
        targetDouble2 == other.targetDouble2 &&
        targetInt2 == other.targetInt2 &&
        typeName == other.typeName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        activity,
        healthyAction,
        progressIntTotal,
        progressIntBool,
        description,
        importance,
        type,
        targetInt,
        targetFoodType,
        id,
        targetDouble,
        targetDouble2,
        targetInt2,
        typeName
      ]);
}

NbaStruct createNbaStruct({
  String? name,
  bool? activity,
  bool? healthyAction,
  int? progressIntTotal,
  bool? progressIntBool,
  String? description,
  String? importance,
  Nba? type,
  int? targetInt,
  MealType? targetFoodType,
  String? id,
  double? targetDouble,
  double? targetDouble2,
  int? targetInt2,
  String? typeName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NbaStruct(
      name: name,
      activity: activity,
      healthyAction: healthyAction,
      progressIntTotal: progressIntTotal,
      progressIntBool: progressIntBool,
      description: description,
      importance: importance,
      type: type,
      targetInt: targetInt,
      targetFoodType: targetFoodType,
      id: id,
      targetDouble: targetDouble,
      targetDouble2: targetDouble2,
      targetInt2: targetInt2,
      typeName: typeName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NbaStruct? updateNbaStruct(
  NbaStruct? nba, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nba
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNbaStructData(
  Map<String, dynamic> firestoreData,
  NbaStruct? nba,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nba == null) {
    return;
  }
  if (nba.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && nba.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nbaData = getNbaFirestoreData(nba, forFieldValue);
  final nestedData = nbaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nba.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNbaFirestoreData(
  NbaStruct? nba, [
  bool forFieldValue = false,
]) {
  if (nba == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nba.toMap());

  // Add any Firestore field values
  nba.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNbaListFirestoreData(
  List<NbaStruct>? nbas,
) =>
    nbas?.map((e) => getNbaFirestoreData(e, true)).toList() ?? [];
