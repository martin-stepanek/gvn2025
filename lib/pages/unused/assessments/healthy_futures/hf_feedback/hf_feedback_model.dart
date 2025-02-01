import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/health_feedback_card/health_feedback_card_widget.dart';
import '/pages/unused/assessments/healthy_futures/health_feedback_metric_tracker/health_feedback_metric_tracker_widget.dart';
import '/pages/unused/assessments/healthy_futures/health_feedback_progress_bar/health_feedback_progress_bar_widget.dart';
import 'hf_feedback_widget.dart' show HfFeedbackWidget;
import 'package:flutter/material.dart';

class HfFeedbackModel extends FlutterFlowModel<HfFeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for health_feedback_metric_tracker component.
  late HealthFeedbackMetricTrackerModel healthFeedbackMetricTrackerModel;
  // Model for health_feedback_progress_bar component.
  late HealthFeedbackProgressBarModel healthFeedbackProgressBarModel;
  // Model for Steps.
  late HealthFeedbackCardModel stepsModel;
  // Model for Energy.
  late HealthFeedbackCardModel energyModel;
  // Model for VO2max.
  late HealthFeedbackCardModel vO2maxModel;
  // Model for HRV.
  late HealthFeedbackCardModel hrvModel;
  // Model for RestingHeartRate.
  late HealthFeedbackCardModel restingHeartRateModel;
  // Model for Sleep.
  late HealthFeedbackCardModel sleepModel;
  // Model for PhysicalActivity.
  late HealthFeedbackCardModel physicalActivityModel;
  // Model for BloodPressure.
  late HealthFeedbackCardModel bloodPressureModel;
  // Model for Cholesterol.
  late HealthFeedbackCardModel cholesterolModel;
  // Model for Glucose.
  late HealthFeedbackCardModel glucoseModel;
  // Model for BMI.
  late HealthFeedbackCardModel bmiModel;
  // Model for Diet.
  late HealthFeedbackCardModel dietModel;
  // Model for Alcohol.
  late HealthFeedbackCardModel alcoholModel;
  // Model for Smoking.
  late HealthFeedbackCardModel smokingModel;

  @override
  void initState(BuildContext context) {
    healthFeedbackMetricTrackerModel =
        createModel(context, () => HealthFeedbackMetricTrackerModel());
    healthFeedbackProgressBarModel =
        createModel(context, () => HealthFeedbackProgressBarModel());
    stepsModel = createModel(context, () => HealthFeedbackCardModel());
    energyModel = createModel(context, () => HealthFeedbackCardModel());
    vO2maxModel = createModel(context, () => HealthFeedbackCardModel());
    hrvModel = createModel(context, () => HealthFeedbackCardModel());
    restingHeartRateModel =
        createModel(context, () => HealthFeedbackCardModel());
    sleepModel = createModel(context, () => HealthFeedbackCardModel());
    physicalActivityModel =
        createModel(context, () => HealthFeedbackCardModel());
    bloodPressureModel = createModel(context, () => HealthFeedbackCardModel());
    cholesterolModel = createModel(context, () => HealthFeedbackCardModel());
    glucoseModel = createModel(context, () => HealthFeedbackCardModel());
    bmiModel = createModel(context, () => HealthFeedbackCardModel());
    dietModel = createModel(context, () => HealthFeedbackCardModel());
    alcoholModel = createModel(context, () => HealthFeedbackCardModel());
    smokingModel = createModel(context, () => HealthFeedbackCardModel());
  }

  @override
  void dispose() {
    healthFeedbackMetricTrackerModel.dispose();
    healthFeedbackProgressBarModel.dispose();
    stepsModel.dispose();
    energyModel.dispose();
    vO2maxModel.dispose();
    hrvModel.dispose();
    restingHeartRateModel.dispose();
    sleepModel.dispose();
    physicalActivityModel.dispose();
    bloodPressureModel.dispose();
    cholesterolModel.dispose();
    glucoseModel.dispose();
    bmiModel.dispose();
    dietModel.dispose();
    alcoholModel.dispose();
    smokingModel.dispose();
  }
}
