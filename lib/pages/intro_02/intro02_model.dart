import '/flutter_flow/flutter_flow_util.dart';
import 'intro02_widget.dart' show Intro02Widget;
import 'package:flutter/material.dart';

class Intro02Model extends FlutterFlowModel<Intro02Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
