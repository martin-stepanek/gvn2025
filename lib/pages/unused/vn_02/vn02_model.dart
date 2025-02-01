import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessment_progress_bar_3/assessment_progress_bar3_widget.dart';
import 'vn02_widget.dart' show Vn02Widget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class Vn02Model extends FlutterFlowModel<Vn02Widget> {
  ///  Local state fields for this page.

  bool recordingAudio = false;

  ///  State fields for stateful widgets in this page.

  // Model for assessment_progress_bar_3 component.
  late AssessmentProgressBar3Model assessmentProgressBar3Model;
  // State field(s) for Reason1 widget.
  FocusNode? reason1FocusNode;
  TextEditingController? reason1TextController;
  String? Function(BuildContext, String?)? reason1TextControllerValidator;
  String? audioRecording01Done;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Custom Action - speechToText] action in Row widget.
  String? audioTranscription;
  // Stores action output result for [Backend Call - API (FoodAnalysis)] action in Row widget.
  ApiCallResponse? apiOutputText;
  AudioRecorder? audioRecorder;
  // Stores action output result for [Backend Call - API (FoodAnalysis)] action in Button widget.
  ApiCallResponse? apiOutput;

  @override
  void initState(BuildContext context) {
    assessmentProgressBar3Model =
        createModel(context, () => AssessmentProgressBar3Model());
  }

  @override
  void dispose() {
    assessmentProgressBar3Model.dispose();
    reason1FocusNode?.dispose();
    reason1TextController?.dispose();
  }
}
