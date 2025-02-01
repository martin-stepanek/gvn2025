import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/assessment_progress_bar/assessment_progress_bar_widget.dart';
import 'hf22_widget.dart' show Hf22Widget;
import 'package:flutter/material.dart';

class Hf22Model extends FlutterFlowModel<Hf22Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for assessment_progress_bar component.
  late AssessmentProgressBarModel assessmentProgressBarModel;
  // State field(s) for SBP widget.
  FocusNode? sbpFocusNode;
  TextEditingController? sbpTextController;
  String? Function(BuildContext, String?)? sbpTextControllerValidator;
  // State field(s) for SBPdontknow widget.
  bool? sBPdontknowValue;
  // State field(s) for DBP widget.
  FocusNode? dbpFocusNode;
  TextEditingController? dbpTextController;
  String? Function(BuildContext, String?)? dbpTextControllerValidator;
  // State field(s) for DBPdontknow widget.
  bool? dBPdontknowValue;

  @override
  void initState(BuildContext context) {
    assessmentProgressBarModel =
        createModel(context, () => AssessmentProgressBarModel());
  }

  @override
  void dispose() {
    assessmentProgressBarModel.dispose();
    sbpFocusNode?.dispose();
    sbpTextController?.dispose();

    dbpFocusNode?.dispose();
    dbpTextController?.dispose();
  }
}
