import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'communication_intro_widget.dart' show CommunicationIntroWidget;
import 'package:flutter/material.dart';

class CommunicationIntroModel
    extends FlutterFlowModel<CommunicationIntroWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Frequency widget.
  FormFieldController<String>? frequencyValueController;
  // State field(s) for Tone widget.
  double? toneValue;
  // State field(s) for Personality widget.
  FormFieldController<List<String>>? personalityValueController;
  List<String>? get personalityValues => personalityValueController?.value;
  set personalityValues(List<String>? val) =>
      personalityValueController?.value = val;
  // State field(s) for TimeDiscounting widget.
  FormFieldController<String>? timeDiscountingValueController;
  // State field(s) for Motivation widget.
  FormFieldController<String>? motivationValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Next widget.
  List<NotificationsRecord>? notifications;
  // Stores action output result for [Firestore Query - Query a collection] action in Next widget.
  List<PaDataRecord>? paData;
  // Stores action output result for [Backend Call - API (FoodAnalysis)] action in Next widget.
  ApiCallResponse? personalitySummary;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get frequencyValue => frequencyValueController?.value;
  String? get timeDiscountingValue => timeDiscountingValueController?.value;
  String? get motivationValue => motivationValueController?.value;
}
