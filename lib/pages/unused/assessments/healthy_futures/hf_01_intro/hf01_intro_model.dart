import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/assessment_section/assessment_section_widget.dart';
import 'hf01_intro_widget.dart' show Hf01IntroWidget;
import 'package:flutter/material.dart';

class Hf01IntroModel extends FlutterFlowModel<Hf01IntroWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Demographics.
  late AssessmentSectionModel demographicsModel;
  // Model for PA.
  late AssessmentSectionModel paModel;
  // Model for Nutrition.
  late AssessmentSectionModel nutritionModel;
  // Model for Biometrics.
  late AssessmentSectionModel biometricsModel;
  // Model for Alcohol.
  late AssessmentSectionModel alcoholModel;
  // Model for Sleep.
  late AssessmentSectionModel sleepModel;
  // Model for HealthConditions.
  late AssessmentSectionModel healthConditionsModel;

  @override
  void initState(BuildContext context) {
    demographicsModel = createModel(context, () => AssessmentSectionModel());
    paModel = createModel(context, () => AssessmentSectionModel());
    nutritionModel = createModel(context, () => AssessmentSectionModel());
    biometricsModel = createModel(context, () => AssessmentSectionModel());
    alcoholModel = createModel(context, () => AssessmentSectionModel());
    sleepModel = createModel(context, () => AssessmentSectionModel());
    healthConditionsModel =
        createModel(context, () => AssessmentSectionModel());
  }

  @override
  void dispose() {
    demographicsModel.dispose();
    paModel.dispose();
    nutritionModel.dispose();
    biometricsModel.dispose();
    alcoholModel.dispose();
    sleepModel.dispose();
    healthConditionsModel.dispose();
  }
}
