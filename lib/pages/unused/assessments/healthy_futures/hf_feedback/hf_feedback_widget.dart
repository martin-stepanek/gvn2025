import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/unused/assessments/healthy_futures/health_feedback_card/health_feedback_card_widget.dart';
import '/pages/unused/assessments/healthy_futures/health_feedback_metric_tracker/health_feedback_metric_tracker_widget.dart';
import '/pages/unused/assessments/healthy_futures/health_feedback_progress_bar/health_feedback_progress_bar_widget.dart';
import '/pages/unused/binah_result_feedback/binah_result_feedback_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hf_feedback_model.dart';
export 'hf_feedback_model.dart';

class HfFeedbackWidget extends StatefulWidget {
  const HfFeedbackWidget({super.key});

  @override
  State<HfFeedbackWidget> createState() => _HfFeedbackWidgetState();
}

class _HfFeedbackWidgetState extends State<HfFeedbackWidget> {
  late HfFeedbackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HfFeedbackModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'hf_feedback'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<HfRecord>(
        stream: HfRecord.getDocument(currentUserDocument!.hfRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }

          final hfFeedbackHfRecord = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your health results',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily),
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'This is a snapshot of your overall health. Click on the individual metrics to find out more about them and the ways you can maintain and improve your health.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: wrapWithModel(
                                          model: _model
                                              .healthFeedbackMetricTrackerModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child:
                                              HealthFeedbackMetricTrackerWidget(
                                            bad: hfFeedbackHfRecord
                                                .countUnhealthy,
                                            good:
                                                hfFeedbackHfRecord.countHealthy,
                                            unknown:
                                                hfFeedbackHfRecord.countUnknown,
                                          ),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model
                                            .healthFeedbackProgressBarModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: HealthFeedbackProgressBarWidget(
                                          bad: hfFeedbackHfRecord
                                                  .countUnhealthy /
                                              (hfFeedbackHfRecord.countHealthy +
                                                  hfFeedbackHfRecord
                                                      .countUnhealthy +
                                                  hfFeedbackHfRecord
                                                      .countUnknown),
                                          good: (hfFeedbackHfRecord
                                                      .countHealthy +
                                                  hfFeedbackHfRecord
                                                      .countUnhealthy) /
                                              (hfFeedbackHfRecord.countHealthy +
                                                  hfFeedbackHfRecord
                                                      .countUnhealthy +
                                                  hfFeedbackHfRecord
                                                      .countUnknown),
                                          uknown: 1.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model.stepsModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status: hfFeedbackHfRecord
                                                    .stepsClass,
                                                name: 'Steps',
                                                value: valueOrDefault<String>(
                                                  (hfFeedbackHfRecord.steps !=
                                                              0) &&
                                                          (hfFeedbackHfRecord
                                                                  .steps !=
                                                              9999)
                                                      ? formatNumber(
                                                          hfFeedbackHfRecord
                                                              .steps,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###,###',
                                                          locale: '',
                                                        )
                                                      : '-',
                                                  '-',
                                                ),
                                                unit:
                                                    (hfFeedbackHfRecord.steps !=
                                                                0) &&
                                                            (hfFeedbackHfRecord
                                                                    .steps !=
                                                                9999)
                                                        ? 'daily average'
                                                        : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_Steps_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Steps_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Daily steps',
                                                                (hfFeedbackHfRecord.steps == null) ||
                                                                        (hfFeedbackHfRecord.steps ==
                                                                            9999) ||
                                                                        (hfFeedbackHfRecord.steps ==
                                                                            0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .steps
                                                                        .toString()),
                                                            title: 'Steps',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.energyModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status: hfFeedbackHfRecord
                                                    .caloriesClass,
                                                name: 'Active calories',
                                                value: valueOrDefault<String>(
                                                  (hfFeedbackHfRecord
                                                                  .calories !=
                                                              0) &&
                                                          (hfFeedbackHfRecord
                                                                  .calories !=
                                                              9999)
                                                      ? formatNumber(
                                                          hfFeedbackHfRecord
                                                              .calories,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###,###',
                                                          locale: '',
                                                        )
                                                      : '-',
                                                  '-',
                                                ),
                                                unit: (hfFeedbackHfRecord
                                                                .calories !=
                                                            0) &&
                                                        (hfFeedbackHfRecord
                                                                .calories !=
                                                            9999)
                                                    ? 'daily average'
                                                    : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_Energy_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Energy_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Daily calories',
                                                                (hfFeedbackHfRecord.calories == null) ||
                                                                        (hfFeedbackHfRecord.calories ==
                                                                            9999) ||
                                                                        (hfFeedbackHfRecord.calories ==
                                                                            0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .calories
                                                                        .toString()),
                                                            title:
                                                                'Active calories',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.vO2maxModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status: hfFeedbackHfRecord
                                                    .vo2maxClass,
                                                name: 'VO₂ max',
                                                value: valueOrDefault<String>(
                                                  (hfFeedbackHfRecord.vo2max !=
                                                              0) &&
                                                          (hfFeedbackHfRecord
                                                                  .vo2max !=
                                                              9999)
                                                      ? formatNumber(
                                                          hfFeedbackHfRecord
                                                              .vo2max,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###,###',
                                                          locale: '',
                                                        )
                                                      : '-',
                                                  '-',
                                                ),
                                                unit: (hfFeedbackHfRecord
                                                                .vo2max !=
                                                            0) &&
                                                        (hfFeedbackHfRecord
                                                                .vo2max !=
                                                            9999)
                                                    ? 'mL/kg/min'
                                                    : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_VO2max_CALLBACK');
                                                  logFirebaseEvent(
                                                      'VO2max_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'VO2 max',
                                                                (hfFeedbackHfRecord.vo2max == null) ||
                                                                        (hfFeedbackHfRecord.vo2max ==
                                                                            9999) ||
                                                                        (hfFeedbackHfRecord.vo2max ==
                                                                            0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .vo2max
                                                                        .toString()),
                                                            title: 'VO₂ max',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.hrvModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status:
                                                    hfFeedbackHfRecord.hrvClass,
                                                name: 'Heart rate variability',
                                                value: valueOrDefault<String>(
                                                  (hfFeedbackHfRecord.hrv !=
                                                              0.0) &&
                                                          (hfFeedbackHfRecord
                                                                  .hrv !=
                                                              9999.0)
                                                      ? formatNumber(
                                                          hfFeedbackHfRecord
                                                              .hrv,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###,###',
                                                          locale: '',
                                                        )
                                                      : '-',
                                                  '-',
                                                ),
                                                unit: (hfFeedbackHfRecord.hrv !=
                                                            0.0) &&
                                                        (hfFeedbackHfRecord
                                                                .hrv !=
                                                            9999.0)
                                                    ? '(SDNN)'
                                                    : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_HRV_CALLBACK');
                                                  logFirebaseEvent(
                                                      'HRV_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Heart rate variability (SDNN)',
                                                                (hfFeedbackHfRecord.hrv == null) ||
                                                                        (hfFeedbackHfRecord.hrv ==
                                                                            9999.0) ||
                                                                        (hfFeedbackHfRecord.hrv ==
                                                                            0.0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .hrv
                                                                        .toString()),
                                                            title:
                                                                'Heart rate variability',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.restingHeartRateModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status:
                                                    hfFeedbackHfRecord.rhrClass,
                                                name: 'Resting heart rate',
                                                value: valueOrDefault<String>(
                                                  (hfFeedbackHfRecord.rhr !=
                                                              0) &&
                                                          (hfFeedbackHfRecord
                                                                  .rhr !=
                                                              9999)
                                                      ? formatNumber(
                                                          hfFeedbackHfRecord
                                                              .rhr,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###,###',
                                                          locale: '',
                                                        )
                                                      : '-',
                                                  '-',
                                                ),
                                                unit: (hfFeedbackHfRecord.rhr !=
                                                            0) &&
                                                        (hfFeedbackHfRecord
                                                                .rhr !=
                                                            9999)
                                                    ? 'beats per minute'
                                                    : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_RestingHeartRate_CALLBACK');
                                                  logFirebaseEvent(
                                                      'RestingHeartRate_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Resting heart rate',
                                                                (hfFeedbackHfRecord.rhr == null) ||
                                                                        (hfFeedbackHfRecord.rhr ==
                                                                            9999) ||
                                                                        (hfFeedbackHfRecord.rhr ==
                                                                            0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .rhr
                                                                        .toString()),
                                                            title:
                                                                'Resting heart rate',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.sleepModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status: hfFeedbackHfRecord
                                                    .sleepClass,
                                                name: 'Sleep',
                                                value: (hfFeedbackHfRecord
                                                                .sleep !=
                                                            0.0) &&
                                                        (hfFeedbackHfRecord
                                                                .sleep !=
                                                            9999.0)
                                                    ? formatNumber(
                                                        hfFeedbackHfRecord
                                                            .sleep,
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '###.#',
                                                        locale: '',
                                                      )
                                                    : '-',
                                                unit:
                                                    (hfFeedbackHfRecord.sleep !=
                                                                0.0) &&
                                                            (hfFeedbackHfRecord
                                                                    .sleep !=
                                                                9999.0)
                                                        ? 'hours per day'
                                                        : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_Sleep_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Sleep_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Sleep (hours per day)',
                                                                (hfFeedbackHfRecord.sleep == null) ||
                                                                        (hfFeedbackHfRecord.sleep ==
                                                                            9999.0) ||
                                                                        (hfFeedbackHfRecord.sleep ==
                                                                            0.0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .sleep
                                                                        .toString()),
                                                            title: 'Sleep',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.physicalActivityModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status:
                                                    hfFeedbackHfRecord.paClass,
                                                name: 'Physical activity',
                                                value: hfFeedbackHfRecord
                                                            .paDays !=
                                                        9999
                                                    ? formatNumber(
                                                        hfFeedbackHfRecord
                                                            .paDays,
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '###,###',
                                                        locale: '',
                                                      )
                                                    : '-',
                                                unit:
                                                    hfFeedbackHfRecord.paDays !=
                                                            9999
                                                        ? 'days per week'
                                                        : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PhysicalActivity_CALLBACK');
                                                  logFirebaseEvent(
                                                      'PhysicalActivity_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Physical activity (days per week)',
                                                                (hfFeedbackHfRecord.paDays ==
                                                                            null) ||
                                                                        (hfFeedbackHfRecord.paDays ==
                                                                            9999)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .paDays
                                                                        .toString()),
                                                            title:
                                                                'Physical activity',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.bloodPressureModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status:
                                                    hfFeedbackHfRecord.bpClass,
                                                name: 'Blood pressure',
                                                value: () {
                                                  if (((hfFeedbackHfRecord
                                                                  .bpSys !=
                                                              0) &&
                                                          (hfFeedbackHfRecord
                                                                  .bpSys !=
                                                              9999)) &&
                                                      ((hfFeedbackHfRecord
                                                                  .bpDia !=
                                                              0) &&
                                                          (hfFeedbackHfRecord
                                                                  .bpDia !=
                                                              9999))) {
                                                    return '${hfFeedbackHfRecord.bpSys.toString()}/${hfFeedbackHfRecord.bpDia.toString()}';
                                                  } else if (hfFeedbackHfRecord
                                                          .bpClass ==
                                                      'Healthy') {
                                                    return 'Normal';
                                                  } else if (hfFeedbackHfRecord
                                                          .bpClass !=
                                                      'Unknown') {
                                                    return 'High';
                                                  } else {
                                                    return '-';
                                                  }
                                                }(),
                                                unit: ((hfFeedbackHfRecord
                                                                    .bpSys !=
                                                                0) &&
                                                            (hfFeedbackHfRecord
                                                                    .bpSys !=
                                                                9999)) &&
                                                        ((hfFeedbackHfRecord
                                                                    .bpDia !=
                                                                0) &&
                                                            (hfFeedbackHfRecord
                                                                    .bpDia !=
                                                                9999))
                                                    ? 'mmHg'
                                                    : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_BloodPressure_CALLBACK');
                                                  logFirebaseEvent(
                                                      'BloodPressure_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Blood pressure',
                                                                (hfFeedbackHfRecord.bpSys == null) ||
                                                                        (hfFeedbackHfRecord.bpSys ==
                                                                            9999) ||
                                                                        (hfFeedbackHfRecord.bpSys ==
                                                                            0)
                                                                    ? 'Unknown'
                                                                    : '${hfFeedbackHfRecord.bpSys.toString()}/${hfFeedbackHfRecord.bpDia.toString()}'),
                                                            title:
                                                                'Blood pressure',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.cholesterolModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status: hfFeedbackHfRecord
                                                    .cholClass,
                                                name: 'Cholesterol',
                                                value: () {
                                                  if ((hfFeedbackHfRecord
                                                              .chol !=
                                                          0.0) &&
                                                      (hfFeedbackHfRecord
                                                              .chol !=
                                                          9999.0)) {
                                                    return formatNumber(
                                                      hfFeedbackHfRecord.chol,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    );
                                                  } else if (hfFeedbackHfRecord
                                                          .cholClass ==
                                                      'Healthy') {
                                                    return 'Normal';
                                                  } else if (hfFeedbackHfRecord
                                                          .cholClass !=
                                                      'Unknown') {
                                                    return 'High';
                                                  } else {
                                                    return '-';
                                                  }
                                                }(),
                                                unit:
                                                    (hfFeedbackHfRecord.chol !=
                                                                0.0) &&
                                                            (hfFeedbackHfRecord
                                                                    .chol !=
                                                                9999.0)
                                                        ? 'mmol/l'
                                                        : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_Cholesterol_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Cholesterol_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Cholesterol (mmol/l)',
                                                                (hfFeedbackHfRecord.chol == null) ||
                                                                        (hfFeedbackHfRecord.chol ==
                                                                            9999.0) ||
                                                                        (hfFeedbackHfRecord.chol ==
                                                                            0.0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .chol
                                                                        .toString()),
                                                            title:
                                                                'Cholesterol',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.glucoseModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status: hfFeedbackHfRecord
                                                    .glucClass,
                                                name: 'Blood glucose',
                                                value: () {
                                                  if ((hfFeedbackHfRecord
                                                              .gluc !=
                                                          0.0) &&
                                                      (hfFeedbackHfRecord
                                                              .gluc !=
                                                          9999.0)) {
                                                    return formatNumber(
                                                      hfFeedbackHfRecord.gluc,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    );
                                                  } else if (hfFeedbackHfRecord
                                                          .glucClass ==
                                                      'Healthy') {
                                                    return 'Normal';
                                                  } else if (hfFeedbackHfRecord
                                                          .glucClass !=
                                                      'Unknown') {
                                                    return 'High';
                                                  } else {
                                                    return '-';
                                                  }
                                                }(),
                                                unit:
                                                    (hfFeedbackHfRecord.gluc !=
                                                                0.0) &&
                                                            (hfFeedbackHfRecord
                                                                    .gluc !=
                                                                9999.0)
                                                        ? 'mmol/l'
                                                        : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_Glucose_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Glucose_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Blood glucose (mmol/l)',
                                                                (hfFeedbackHfRecord.gluc == null) ||
                                                                        (hfFeedbackHfRecord.gluc ==
                                                                            9999.0) ||
                                                                        (hfFeedbackHfRecord.gluc ==
                                                                            0.0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .gluc
                                                                        .toString()),
                                                            title:
                                                                'Blood glucose',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.bmiModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status:
                                                    hfFeedbackHfRecord.bmiClass,
                                                name: 'BMI',
                                                value: (hfFeedbackHfRecord
                                                                .bmi !=
                                                            0.0) &&
                                                        (hfFeedbackHfRecord
                                                                .bmi !=
                                                            9999.0)
                                                    ? formatNumber(
                                                        hfFeedbackHfRecord.bmi,
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '###.#',
                                                        locale: '',
                                                      )
                                                    : '-',
                                                unit: (hfFeedbackHfRecord.bmi !=
                                                            0.0) &&
                                                        (hfFeedbackHfRecord
                                                                .bmi !=
                                                            9999.0)
                                                    ? 'kg/m2'
                                                    : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_BMI_CALLBACK');
                                                  logFirebaseEvent(
                                                      'BMI_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'BMI',
                                                                (hfFeedbackHfRecord.bmi == null) ||
                                                                        (hfFeedbackHfRecord.bmi ==
                                                                            9999.0) ||
                                                                        (hfFeedbackHfRecord.bmi ==
                                                                            0.0)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .bmi
                                                                        .toString()),
                                                            title: 'BMI',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.dietModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status: hfFeedbackHfRecord
                                                    .nutritionClass,
                                                name: 'Diet',
                                                value: hfFeedbackHfRecord
                                                                .nutritionClass !=
                                                            ''
                                                    ? hfFeedbackHfRecord
                                                        .nutritionClass
                                                    : '-',
                                                unit: ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_Diet_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Diet_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Overall diet',
                                                                (hfFeedbackHfRecord.nutritionFastFood == null) ||
                                                                        (hfFeedbackHfRecord.nutritionRedMeat ==
                                                                            null) ||
                                                                        (hfFeedbackHfRecord.nutritionFruit ==
                                                                            null)
                                                                    ? 'Unknown'
                                                                    : 'Fast food and processed meat consumption: ${hfFeedbackHfRecord.nutritionFastFood?.name}; red meat consumption: ${hfFeedbackHfRecord.nutritionRedMeat?.name}; consumption of fruits, vegetables, wholegrains, nuts, and seeds: ${hfFeedbackHfRecord.nutritionFruit?.name}'),
                                                            title: 'Nutrition',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.alcoholModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status:
                                                    hfFeedbackHfRecord.alcClass,
                                                name: 'Alcohol',
                                                value: hfFeedbackHfRecord
                                                            .alcohol !=
                                                        null
                                                    ? formatNumber(
                                                        hfFeedbackHfRecord
                                                            .alcohol,
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '###,###',
                                                        locale: '',
                                                      )
                                                    : '-',
                                                unit: hfFeedbackHfRecord
                                                            .alcohol !=
                                                        null
                                                    ? 'drinks per week'
                                                    : ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_Alcohol_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Alcohol_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions.openAiBinahResultsFeedback(
                                                                'Alcohol (drinks per week)',
                                                                (hfFeedbackHfRecord.alcohol ==
                                                                            null) ||
                                                                        (hfFeedbackHfRecord.alcohol ==
                                                                            9999)
                                                                    ? 'Unknown'
                                                                    : hfFeedbackHfRecord
                                                                        .alcohol
                                                                        .toString()),
                                                            title: 'Alcohol',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.smokingModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HealthFeedbackCardWidget(
                                                status: valueOrDefault<String>(
                                                  () {
                                                    if (hfFeedbackHfRecord
                                                            .smoking ==
                                                        Smoking.current) {
                                                      return 'High';
                                                    } else if (hfFeedbackHfRecord
                                                            .smoking ==
                                                        Smoking.past) {
                                                      return 'Moderate';
                                                    } else {
                                                      return 'Healthy';
                                                    }
                                                  }(),
                                                  'Low',
                                                ),
                                                name: 'Smoking',
                                                value: () {
                                                  if (hfFeedbackHfRecord
                                                          .smoking ==
                                                      Smoking.current) {
                                                    return 'Current smoker';
                                                  } else if (hfFeedbackHfRecord
                                                          .smoking ==
                                                      Smoking.past) {
                                                    return 'Past smoker';
                                                  } else {
                                                    return 'Non-smoker';
                                                  }
                                                }(),
                                                unit: ' ',
                                                redirectAction: () async {
                                                  logFirebaseEvent(
                                                      'HF_FEEDBACK_PAGE_Smoking_CALLBACK');
                                                  logFirebaseEvent(
                                                      'Smoking_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BinahResultFeedbackWidget(
                                                            messages: functions
                                                                .openAiBinahResultsFeedback(
                                                                    'Smoking',
                                                                    hfFeedbackHfRecord.smoking ==
                                                                            null
                                                                        ? 'Unknown'
                                                                        : () {
                                                                            if (hfFeedbackHfRecord.smoking ==
                                                                                Smoking.current) {
                                                                              return 'Current smoker';
                                                                            } else if (hfFeedbackHfRecord.smoking == Smoking.past) {
                                                                              return 'Past smoker';
                                                                            } else {
                                                                              return 'Non-smoker';
                                                                            }
                                                                          }()),
                                                            title: 'Smoking',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                            ),
                                          ]
                                              .divide(const SizedBox(height: 15.0))
                                              .addToStart(const SizedBox(height: 5.0))
                                              .addToEnd(const SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ].addToEnd(const SizedBox(height: 20.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'HF_FEEDBACK_PAGE_CONTINUE_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              progress: Progress.onboarding_complete,
                            ));
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
