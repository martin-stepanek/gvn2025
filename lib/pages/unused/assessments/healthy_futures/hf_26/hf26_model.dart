import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/unused/assessments/healthy_futures/assessment_progress_bar/assessment_progress_bar_widget.dart';
import 'hf26_widget.dart' show Hf26Widget;
import 'package:flutter/material.dart';

class Hf26Model extends FlutterFlowModel<Hf26Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for assessment_progress_bar component.
  late AssessmentProgressBarModel assessmentProgressBarModel;
  // State field(s) for mmolL widget.
  FocusNode? mmolLFocusNode;
  TextEditingController? mmolLTextController;
  String? Function(BuildContext, String?)? mmolLTextControllerValidator;
  // State field(s) for mgdL widget.
  FocusNode? mgdLFocusNode;
  TextEditingController? mgdLTextController;
  String? Function(BuildContext, String?)? mgdLTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for dontknow widget.
  bool? dontknowValue;

  @override
  void initState(BuildContext context) {
    assessmentProgressBarModel =
        createModel(context, () => AssessmentProgressBarModel());
  }

  @override
  void dispose() {
    assessmentProgressBarModel.dispose();
    mmolLFocusNode?.dispose();
    mmolLTextController?.dispose();

    mgdLFocusNode?.dispose();
    mgdLTextController?.dispose();
  }
}
