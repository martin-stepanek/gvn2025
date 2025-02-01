import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'binah_result_feedback_model.dart';
export 'binah_result_feedback_model.dart';

class BinahResultFeedbackWidget extends StatefulWidget {
  const BinahResultFeedbackWidget({
    super.key,
    required this.messages,
    required this.title,
  });

  final List<dynamic>? messages;
  final String? title;

  @override
  State<BinahResultFeedbackWidget> createState() =>
      _BinahResultFeedbackWidgetState();
}

class _BinahResultFeedbackWidgetState extends State<BinahResultFeedbackWidget> {
  late BinahResultFeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BinahResultFeedbackModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BINAH_RESULT_FEEDBACK_binah_result_feedb');
      logFirebaseEvent('binah_result_feedback_backend_call');
      _model.feedback = await OpenAIGroup.foodAnalysisCall.call(
        model: 'gpt-4o',
        messagesJson: widget.messages,
      );

      if ((_model.feedback?.succeeded ?? true)) {
        logFirebaseEvent('binah_result_feedback_update_component_s');
        _model.feedbackReady = true;
        safeSetState(() {});
        return;
      } else {
        logFirebaseEvent('binah_result_feedback_bottom_sheet');
        Navigator.pop(context);
        logFirebaseEvent('binah_result_feedback_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'API error: ${(_model.feedback?.statusCode ?? 200).toString()}',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).info,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            ),
            duration: const Duration(milliseconds: 2000),
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
          ),
        );
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 60.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  if (_model.feedbackReady) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.title,
                                    'NULL',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.openAiOutput(
                                        OpenAIGroup.foodAnalysisCall
                                            .content(
                                              (_model.feedback?.jsonBody ?? ''),
                                            )
                                            .toString(),
                                        'information'),
                                    'NULL',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.openAiOutput(
                                        OpenAIGroup.foodAnalysisCall
                                            .content(
                                              (_model.feedback?.jsonBody ?? ''),
                                            )
                                            .toString(),
                                        'links_intro'),
                                    'NULL',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'BINAH_RESULT_FEEDBACK_Text_w9ytcgo0_ON_T');
                                    logFirebaseEvent('Text_launch_u_r_l');
                                    await launchURL(valueOrDefault<String>(
                                      functions.openAiOutput(
                                          OpenAIGroup.foodAnalysisCall
                                              .content(
                                                (_model.feedback?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                          'links_http'),
                                      'NULL',
                                    ));
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.openAiOutput(
                                          OpenAIGroup.foodAnalysisCall
                                              .content(
                                                (_model.feedback?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                          'links_http'),
                                      'NULL',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          decoration: TextDecoration.underline,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 15.0)),
                      ),
                    );
                  } else {
                    return Lottie.asset(
                      'assets/jsons/Loading_animation.json',
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      height: 100.0,
                      fit: BoxFit.contain,
                      animate: true,
                    );
                  }
                },
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('BINAH_RESULT_FEEDBACK_CONTINUE_BTN_ON_TA');
                logFirebaseEvent('Button_bottom_sheet');
                Navigator.pop(context);
              },
              text: 'Continue',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
