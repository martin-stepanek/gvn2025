import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'binah_result_feedback_widget.dart' show BinahResultFeedbackWidget;
import 'package:flutter/material.dart';

class BinahResultFeedbackModel
    extends FlutterFlowModel<BinahResultFeedbackWidget> {
  ///  Local state fields for this component.

  bool feedbackReady = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (FoodAnalysis)] action in binah_result_feedback widget.
  ApiCallResponse? feedback;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
