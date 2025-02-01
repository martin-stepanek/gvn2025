import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/php_assessment_progress_bar_01/php_assessment_progress_bar01_widget.dart';
import 'onboarding03_widget.dart' show Onboarding03Widget;
import 'package:flutter/material.dart';

class Onboarding03Model extends FlutterFlowModel<Onboarding03Widget> {
  ///  Local state fields for this page.

  String widgetId = 'gender';

  ///  State fields for stateful widgets in this page.

  // Model for php_assessment_progress_bar_01 component.
  late PhpAssessmentProgressBar01Model phpAssessmentProgressBar01Model;

  @override
  void initState(BuildContext context) {
    phpAssessmentProgressBar01Model =
        createModel(context, () => PhpAssessmentProgressBar01Model());
  }

  @override
  void dispose() {
    phpAssessmentProgressBar01Model.dispose();
  }
}
