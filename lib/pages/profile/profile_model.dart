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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailForPasswordResetFocusNode?.dispose();
    emailForPasswordResetTextController?.dispose();
  }
}
