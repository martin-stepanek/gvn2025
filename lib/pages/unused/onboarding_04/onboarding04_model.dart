import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding04_widget.dart' show Onboarding04Widget;
import 'package:flutter/material.dart';

class Onboarding04Model extends FlutterFlowModel<Onboarding04Widget> {
  ///  Local state fields for this page.

  dynamic hiResults;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - connectAppleHealth] action in Button widget.
  bool? appleHealthSuccessUS;
  // Stores action output result for [Custom Action - getDataAppleHealth] action in Button widget.
  List<CombinedDataStruct>? appleHealthData;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PaDataRecord>? paData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
