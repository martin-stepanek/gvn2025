import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mw_check_in_model.dart';
export 'mw_check_in_model.dart';

class MwCheckInWidget extends StatefulWidget {
  const MwCheckInWidget({super.key});

  @override
  State<MwCheckInWidget> createState() => _MwCheckInWidgetState();
}

class _MwCheckInWidgetState extends State<MwCheckInWidget>
    with TickerProviderStateMixin {
  late MwCheckInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MwCheckInModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mw_check_in'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MW_CHECK_IN_mw_check_in_ON_INIT_STATE');
      logFirebaseEvent('mw_check_in_update_page_state');
      _model.step = 0;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              () {
                if (_model.mood == 1) {
                  return const Color(0xFF6B7184);
                } else if (_model.mood == 2) {
                  return const Color(0xFF8F96A6);
                } else if (_model.mood == 3) {
                  return const Color(0xFF8D93CD);
                } else if (_model.mood == 4) {
                  return const Color(0xFF3EBBAC);
                } else if (_model.mood == 5) {
                  return const Color(0xFFF3B346);
                } else {
                  return FlutterFlowTheme.of(context).primaryBackground;
                }
              }(),
              FlutterFlowTheme.of(context).primary,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Builder(
                  builder: (context) {
                    if (_model.mood == 1) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(
                          color: const Color(0x00F3F3F3),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'assets/images/Bad.PNG',
                            ).image,
                          ),
                        ),
                      );
                    } else if (_model.mood == 2) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(
                          color: const Color(0x00F3F3F3),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'assets/images/Poor.PNG',
                            ).image,
                          ),
                        ),
                      );
                    } else if (_model.mood == 3) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(
                          color: const Color(0x00F3F3F3),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'assets/images/Fair.PNG',
                            ).image,
                          ),
                        ),
                      );
                    } else if (_model.mood == 4) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(
                          color: const Color(0x00F3F3F3),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'assets/images/Good.PNG',
                            ).image,
                          ),
                        ),
                      );
                    } else if (_model.mood == 5) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: BoxDecoration(
                          color: const Color(0x00F3F3F3),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'assets/images/Great.PNG',
                            ).image,
                          ),
                        ),
                      );
                    } else {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: const BoxDecoration(),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 60.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Text(
                            'How are you feeling right now?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: (_model.mood != null) &&
                                          (_model.mood != 0)
                                      ? FlutterFlowTheme.of(context).info
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                () {
                                  if (_model.mood == 1) {
                                    return 'Awful';
                                  } else if (_model.mood == 2) {
                                    return 'Bad';
                                  } else if (_model.mood == 3) {
                                    return 'Okay';
                                  } else if (_model.mood == 4) {
                                    return 'Good';
                                  } else if (_model.mood == 5) {
                                    return 'Great';
                                  } else {
                                    return 'Please select';
                                  }
                                }(),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      color: (_model.mood != null) &&
                                              (_model.mood != 0)
                                          ? FlutterFlowTheme.of(context).info
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      fontSize: 20.0,
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
                        Slider(
                          activeColor: _model.step == 0
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).lineColor,
                          inactiveColor: FlutterFlowTheme.of(context).lineColor,
                          min: 1.0,
                          max: 5.0,
                          value: _model.sliderValue ??= 3.0,
                          divisions: 4,
                          onChanged: (_model.step! > 0)
                              ? null
                              : (newValue) async {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  safeSetState(
                                      () => _model.sliderValue = newValue);
                                  logFirebaseEvent(
                                      'MW_CHECK_IN_Slider_5aij6ygv_ON_FORM_WIDG');
                                  logFirebaseEvent('Slider_update_page_state');
                                  _model.mood = (_model.sliderValue!).round();
                                  safeSetState(() {});
                                },
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Is there anything specific that contributed to your mood?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  hintText: 'What made you happy or sad?',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                maxLines: null,
                                minLines: 2,
                                cursorColor: FlutterFlowTheme.of(context).info,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ).animateOnActionTrigger(
                            animationsMap['columnOnActionTriggerAnimation']!,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: (_model.step == 0)
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'MW_CHECK_IN_PAGE_PREVIOUS_BTN_ON_TAP');
                                    logFirebaseEvent('Button_widget_animation');
                                    if (animationsMap[
                                            'columnOnActionTriggerAnimation'] !=
                                        null) {
                                      await animationsMap[
                                              'columnOnActionTriggerAnimation']!
                                          .controller
                                          .reverse();
                                    }
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    _model.step = 0;
                                    safeSetState(() {});
                                  },
                            text: 'Previous',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyLargeFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              disabledColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: ((_model.mood == null) ||
                                    (_model.mood == 0))
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'MW_CHECK_IN_PAGE_NEXT_BTN_ON_TAP');
                                    if (_model.step == 0) {
                                      logFirebaseEvent(
                                          'Button_widget_animation');
                                      if (animationsMap[
                                              'columnOnActionTriggerAnimation'] !=
                                          null) {
                                        await animationsMap[
                                                'columnOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                      logFirebaseEvent(
                                          'Button_update_page_state');
                                      _model.step = 1;
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent('Button_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData());
                                      logFirebaseEvent('Button_backend_call');

                                      await MoodRecord.createDoc(
                                              currentUserReference!)
                                          .set(createMoodRecordData(
                                        createdAt: getCurrentTimestamp,
                                        mood: () {
                                          if (_model.sliderValue == 1.0) {
                                            return Mood.Awful;
                                          } else if (_model.sliderValue ==
                                              2.0) {
                                            return Mood.Bad;
                                          } else if (_model.sliderValue ==
                                              3.0) {
                                            return Mood.Okay;
                                          } else if (_model.sliderValue ==
                                              4.0) {
                                            return Mood.Good;
                                          } else if (_model.sliderValue ==
                                              5.0) {
                                            return Mood.Great;
                                          } else {
                                            return Mood.Unknown;
                                          }
                                        }(),
                                        notes: _model.textController.text,
                                      ));
                                      logFirebaseEvent(
                                          'Button_firestore_query');
                                      _model.moods = await queryMoodRecordOnce(
                                        parent: currentUserReference,
                                        queryBuilder: (moodRecord) =>
                                            moodRecord.orderBy('created_at',
                                                descending: true),
                                        limit: 10,
                                      );
                                      logFirebaseEvent('Button_backend_call');
                                      _model.apiOutput = await OpenAIGroup
                                          .foodAnalysisCall
                                          .call(
                                        model: 'gpt-4o',
                                        messagesJson:
                                            functions.openAiFeedbackMood(
                                                _model.moods!.toList()),
                                      );

                                      if ((_model.apiOutput?.succeeded ??
                                          true)) {
                                        logFirebaseEvent('Button_backend_call');

                                        await CoachMessagesRecord.createDoc(
                                                currentUserReference!)
                                            .set(createCoachMessagesRecordData(
                                          createdAt: getCurrentTimestamp,
                                          title:
                                              'Thanks for letting me know how you feel!',
                                          text: valueOrDefault<String>(
                                            functions.openAiOutput(
                                                OpenAIGroup.foodAnalysisCall
                                                    .content(
                                                      (_model.apiOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    .toString(),
                                                'statement'),
                                            'NULL',
                                          ),
                                          link: '',
                                          showFrom: getCurrentTimestamp,
                                          showUntil: getCurrentTimestamp,
                                          show: true,
                                        ));
                                      } else {
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'API error: ${(_model.apiOutput?.statusCode ?? 200).toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 2000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                            text: _model.step == 0 ? 'Next' : 'Submit',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyLargeFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).secondary,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).lightGrey,
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 15.0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
