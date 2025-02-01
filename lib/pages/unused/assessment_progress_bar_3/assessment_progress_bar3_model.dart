import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/assessment_progress_bar_component/assessment_progress_bar_component_widget.dart';
import 'assessment_progress_bar3_widget.dart' show AssessmentProgressBar3Widget;
import 'package:flutter/material.dart';

class AssessmentProgressBar3Model
    extends FlutterFlowModel<AssessmentProgressBar3Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for assessment_progress_bar_component component.
  late AssessmentProgressBarComponentModel assessmentProgressBarComponentModel1;
  // Model for assessment_progress_bar_component component.
  late AssessmentProgressBarComponentModel assessmentProgressBarComponentModel2;
  // Model for assessment_progress_bar_component component.
  late AssessmentProgressBarComponentModel assessmentProgressBarComponentModel3;

  @override
  void initState(BuildContext context) {
    assessmentProgressBarComponentModel1 =
        createModel(context, () => AssessmentProgressBarComponentModel());
    assessmentProgressBarComponentModel2 =
        createModel(context, () => AssessmentProgressBarComponentModel());
    assessmentProgressBarComponentModel3 =
        createModel(context, () => AssessmentProgressBarComponentModel());
  }

  @override
  void dispose() {
    assessmentProgressBarComponentModel1.dispose();
    assessmentProgressBarComponentModel2.dispose();
    assessmentProgressBarComponentModel3.dispose();
  }
}
