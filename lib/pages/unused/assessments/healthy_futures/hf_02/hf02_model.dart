import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/assessment_progress_bar/assessment_progress_bar_widget.dart';
import 'hf02_widget.dart' show Hf02Widget;
import 'package:flutter/material.dart';

class Hf02Model extends FlutterFlowModel<Hf02Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for assessment_progress_bar component.
  late AssessmentProgressBarModel assessmentProgressBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    assessmentProgressBarModel =
        createModel(context, () => AssessmentProgressBarModel());
  }

  @override
  void dispose() {
    assessmentProgressBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
