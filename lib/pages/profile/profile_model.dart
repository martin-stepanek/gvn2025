import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  int? loopIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailForPasswordReset widget.
  FocusNode? emailForPasswordResetFocusNode;
  TextEditingController? emailForPasswordResetTextController;
  String? Function(BuildContext, String?)?
      emailForPasswordResetTextControllerValidator;
  // Stores action output result for [Custom Action - connectAppleHealth] action in linkTracker widget.
  bool? appleHealthSuccess;
  // Stores action output result for [Custom Action - getDataAppleHealth] action in refreshData widget.
  List<CombinedDataStruct>? appleHealthData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailForPasswordResetFocusNode?.dispose();
    emailForPasswordResetTextController?.dispose();
  }
}
