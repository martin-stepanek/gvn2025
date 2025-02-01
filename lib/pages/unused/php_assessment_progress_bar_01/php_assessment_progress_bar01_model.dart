import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/assessment_progress_bar_component/assessment_progress_bar_component_widget.dart';
import 'php_assessment_progress_bar01_widget.dart'
    show PhpAssessmentProgressBar01Widget;
import 'package:flutter/material.dart';

class PhpAssessmentProgressBar01Model
    extends FlutterFlowModel<PhpAssessmentProgressBar01Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for assessment_progress_bar_component component.
  late AssessmentProgressBarComponentModel assessmentProgressBarComponentModel1;
  // Model for assessment_progress_bar_component component.
  late AssessmentProgressBarComponentModel assessmentProgressBarComponentModel2;

  @override
  void initState(BuildContext context) {
    assessmentProgressBarComponentModel1 =
        createModel(context, () => AssessmentProgressBarComponentModel());
    assessmentProgressBarComponentModel2 =
        createModel(context, () => AssessmentProgressBarComponentModel());
  }

  @override
  void dispose() {
    assessmentProgressBarComponentModel1.dispose();
    assessmentProgressBarComponentModel2.dispose();
  }
}
