import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_bubbles_widget.dart' show ChatBubblesWidget;
import 'package:flutter/material.dart';

class ChatBubblesModel extends FlutterFlowModel<ChatBubblesWidget> {
  ///  Local state fields for this component.

  bool copyHover = false;

  User? user = User.user;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
