import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'intro20_widget.dart' show Intro20Widget;
import 'package:flutter/material.dart';

class Intro20Model extends FlutterFlowModel<Intro20Widget> {
  ///  Local state fields for this page.

  NbaRecord? nba;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Custom Action - connectAppleHealth] action in Next widget.
  bool? appleHealthSuccess;
  // Stores action output result for [Custom Action - getDataAppleHealth] action in Next widget.
  List<CombinedDataStruct>? appleHealthData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future addNBA(
    BuildContext context, {
    required List<CombinedDataStruct>? combinedData,
    List<NbaRecord>? availableNbas,
  }) async {}
}
