import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/unused/assessments/healthy_futures/assessment_section/assessment_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hf01_intro_model.dart';
export 'hf01_intro_model.dart';

class Hf01IntroWidget extends StatefulWidget {
  const Hf01IntroWidget({super.key});

  @override
  State<Hf01IntroWidget> createState() => _Hf01IntroWidgetState();
}

class _Hf01IntroWidgetState extends State<Hf01IntroWidget> {
  late Hf01IntroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Hf01IntroModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'hf_01_intro'});
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).secondaryText),
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('HF_01_INTRO_PAGE_Icon_9ag7h6gs_ON_TAP');
              logFirebaseEvent('Icon_navigate_back');
              context.safePop();
            },
            child: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 22.0,
            ),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Health Assessment',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  14.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 2.0,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.demographicsModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AssessmentSectionWidget(
                                      title: 'Demographics',
                                      text:
                                          'Let’s start with your background. Answering these questions will help us personalise your health recommendations.',
                                      number: 1,
                                      showText: true,
                                      done: false,
                                      showExplanation: false,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.paModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AssessmentSectionWidget(
                                      title: 'Physical activity and fitness',
                                      text:
                                          'We\'ve got this data from your activity tracker.',
                                      number: 2,
                                      showText: false,
                                      done: true,
                                      showExplanation: true,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.nutritionModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AssessmentSectionWidget(
                                      title: 'Nutrition',
                                      text:
                                          'Ready to tell us about your diet? Answer these questions to give us more information on your usual eating habits or take a few photos of your meals.',
                                      number: 3,
                                      showText: false,
                                      done: false,
                                      showExplanation: false,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.biometricsModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AssessmentSectionWidget(
                                      title: 'Biometrics',
                                      text:
                                          'In this section, we’ll find out more about your health history and measurements. Answer these questions to the best of your ability.\n\nYou\'ve answered questions about BMI already.',
                                      number: 4,
                                      showText: false,
                                      done: false,
                                      showExplanation: false,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.alcoholModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AssessmentSectionWidget(
                                      title: 'Alcohol and tobacco',
                                      text:
                                          'Understanding your current alcohol or tobacco use is important to guide your overall health recommendations. You\'ve answered questions about tobacco already.',
                                      number: 5,
                                      showText: false,
                                      done: false,
                                      showExplanation: false,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.sleepModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AssessmentSectionWidget(
                                      title: 'Sleep',
                                      text:
                                          'We\'ve got this data from your activity tracker.',
                                      number: 6,
                                      showText: false,
                                      done: true,
                                      showExplanation: true,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.healthConditionsModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AssessmentSectionWidget(
                                      title: 'Health conditions',
                                      text: 'You\'ve answered this already.',
                                      number: 7,
                                      showText: false,
                                      done: true,
                                      showExplanation: true,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 20.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('HF_01_INTRO_PAGE_NEXT_BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');

                      var hfRecordReference =
                          HfRecord.createDoc(currentUserReference!);
                      await hfRecordReference.set(createHfRecordData(
                        createdAt: getCurrentTimestamp,
                      ));
                      _model.hfRef = HfRecord.getDocumentFromData(
                          createHfRecordData(
                            createdAt: getCurrentTimestamp,
                          ),
                          hfRecordReference);
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        progress: Progress.hf_demographics,
                        hfRef: _model.hfRef?.reference,
                      ));
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('hf_02');

                      safeSetState(() {});
                    },
                    text: 'Next',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyLarge
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
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
  }
}
