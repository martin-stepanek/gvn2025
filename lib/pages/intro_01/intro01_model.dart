import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'intro01_widget.dart' show Intro01Widget;
import 'package:flutter/material.dart';

class Intro01Model extends FlutterFlowModel<Intro01Widget> {
  ///  Local state fields for this page.

  int index = 0;

  List<NbaStruct> nbaList = [];
  void addToNbaList(NbaStruct item) => nbaList.add(item);
  void removeFromNbaList(NbaStruct item) => nbaList.remove(item);
  void removeAtIndexFromNbaList(int index) => nbaList.removeAt(index);
  void insertAtIndexInNbaList(int index, NbaStruct item) =>
      nbaList.insert(index, item);
  void updateNbaListAtIndex(int index, Function(NbaStruct) updateFn) =>
      nbaList[index] = updateFn(nbaList[index]);

  NbaStruct? nbaDataType;
  void updateNbaDataTypeStruct(Function(NbaStruct) updateFn) {
    updateFn(nbaDataType ??= NbaStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for username widget.
  String? usernameValue;
  FormFieldController<String>? usernameValueController;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in LogIn widget.
  ChatsRecord? newChatRef;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
