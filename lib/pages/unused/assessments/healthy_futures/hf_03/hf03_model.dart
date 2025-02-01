import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/assessment_progress_bar/assessment_progress_bar_widget.dart';
import 'hf03_widget.dart' show Hf03Widget;
import 'package:flutter/material.dart';

class Hf03Model extends FlutterFlowModel<Hf03Widget> {
  ///  Local state fields for this page.

  String widgetId = 'gender';

  ///  State fields for stateful widgets in this page.

  // Model for assessment_progress_bar component.
  late AssessmentProgressBarModel assessmentProgressBarModel;

  @override
  void initState(BuildContext context) {
    assessmentProgressBarModel =
        createModel(context, () => AssessmentProgressBarModel());
  }

  @override
  void dispose() {
    assessmentProgressBarModel.dispose();
  }
}
