import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mw_check_in_widget.dart' show MwCheckInWidget;
import 'package:flutter/material.dart';

class MwCheckInModel extends FlutterFlowModel<MwCheckInWidget> {
  ///  Local state fields for this page.

  int? step = 0;

  int? mood = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MoodRecord>? moods;
  // Stores action output result for [Backend Call - API (FoodAnalysis)] action in Button widget.
  ApiCallResponse? apiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
