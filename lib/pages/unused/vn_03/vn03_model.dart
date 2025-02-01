import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessment_progress_bar_3/assessment_progress_bar3_widget.dart';
import 'vn03_widget.dart' show Vn03Widget;
import 'package:flutter/material.dart';

class Vn03Model extends FlutterFlowModel<Vn03Widget> {
  ///  Local state fields for this page.

  String progress = 'not_started';

  ///  State fields for stateful widgets in this page.

  // Model for assessment_progress_bar_3 component.
  late AssessmentProgressBar3Model assessmentProgressBar3Model;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (FoodAnalysis)] action in Row widget.
  ApiCallResponse? imageAnalysisOutput;

  @override
  void initState(BuildContext context) {
    assessmentProgressBar3Model =
        createModel(context, () => AssessmentProgressBar3Model());
  }

  @override
  void dispose() {
    assessmentProgressBar3Model.dispose();
  }
}
