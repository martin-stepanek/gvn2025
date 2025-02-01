import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'expandable_button_model.dart';
export 'expandable_button_model.dart';

class ExpandableButtonWidget extends StatefulWidget {
  const ExpandableButtonWidget({super.key});

  @override
  State<ExpandableButtonWidget> createState() => _ExpandableButtonWidgetState();
}

class _ExpandableButtonWidgetState extends State<ExpandableButtonWidget>
    with TickerProviderStateMixin {
  late ExpandableButtonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpandableButtonModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_model.buttonExpanded)
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 220.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 26.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'TAKE A FOOD PHOTO',
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.phone_iphone,
                              color: Colors.white,
                              size: 26.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'FACE SCAN',
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation3']!,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('EXPANDABLE_BUTTON_COMP_HF_ON_TAP');
                        logFirebaseEvent('HF_navigate_to');

                        context.pushNamed('hf_01_intro');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.health_and_safety,
                                color: Colors.white,
                                size: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'HEALTH ASSESSMENT',
                                  style: FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation4']!,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('EXPANDABLE_BUTTON_COMP_Mood_ON_TAP');
                        logFirebaseEvent('Mood_navigate_to');

                        context.pushNamed('mw_check_in');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.emoji_emotions,
                                color: Colors.white,
                                size: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'MOOD CHECK-IN',
                                  style: FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation5']!,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.man,
                              color: Colors.white,
                              size: 26.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'BODY ANALYSIS',
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation6']!,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.sports_gymnastics,
                              color: Colors.white,
                              size: 26.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'WORKOUTS',
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation7']!,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'EXPANDABLE_BUTTON_AIverification_ON_TAP');
                        logFirebaseEvent('AIverification_navigate_to');

                        context.pushNamed('vn_intro');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'AI VERIFICATION',
                                  style: FlutterFlowTheme.of(context)
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation8']!,
                    ),
                  ],
                ),
              ),
            ),
          ).animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation1']!,
          ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('EXPANDABLE_BUTTON_ExpandableFAB_ON_TAP');
              if (_model.buttonExpanded) {
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation1'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation1']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation2'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation2']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation3'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation3']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation4'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation4']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation5'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation5']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation6'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation6']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation7'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation7']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation8'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation8']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['iconOnActionTriggerAnimation1'] != null) {
                  animationsMap['iconOnActionTriggerAnimation1']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['iconOnActionTriggerAnimation2'] != null) {
                  animationsMap['iconOnActionTriggerAnimation2']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('ExpandableFAB_update_component_state');
                _model.buttonExpanded = false;
                safeSetState(() {});
              } else {
                logFirebaseEvent('ExpandableFAB_update_component_state');
                _model.buttonExpanded = true;
                safeSetState(() {});
                logFirebaseEvent('ExpandableFAB_wait__delay');
                await Future.delayed(const Duration(milliseconds: 20));
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation1'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation1']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation2'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation2']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation3'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation3']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation4'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation4']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation5'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation5']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation6'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation6']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation7'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation7']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['containerOnActionTriggerAnimation8'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation8']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['iconOnActionTriggerAnimation1'] != null) {
                  animationsMap['iconOnActionTriggerAnimation1']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('ExpandableFAB_widget_animation');
                if (animationsMap['iconOnActionTriggerAnimation2'] != null) {
                  animationsMap['iconOnActionTriggerAnimation2']!
                      .controller
                      .forward(from: 0.0);
                }
              }
            },
            child: Material(
              color: Colors.transparent,
              elevation: 3.0,
              shape: const CircleBorder(),
              child: ClipOval(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24.0,
                      ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation1']!,
                      ),
                      const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 24.0,
                      ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation2']!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
