import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding04_model.dart';
export 'onboarding04_model.dart';

class Onboarding04Widget extends StatefulWidget {
  const Onboarding04Widget({super.key});

  @override
  State<Onboarding04Widget> createState() => _Onboarding04WidgetState();
}

class _Onboarding04WidgetState extends State<Onboarding04Widget> {
  late Onboarding04Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding04Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'onboarding_04'});
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Skip',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Apple_Health.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 29.0, 0.0, 0.0),
                      child: Text(
                        'Connect to Health app',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                                  lineHeight: 1.14,
                                ),
                      ),
                    ),
                    Text(
                      'To get the maximum benefit from this program, allow Power of Vitality to read data stored in your Health app to automatically track progress and completion of program activities.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                            lineHeight: 1.25,
                          ),
                    ),
                    Text(
                      'Your privacy is as important to us as it is to you. Your individual data is never shared without your consent. ',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Roboto'),
                            lineHeight: 1.25,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ONBOARDING_04_CONNECT_NOW_BTN_ON_TAP');
                          var shouldSetState = false;
                          logFirebaseEvent('Button_custom_action');
                          _model.appleHealthSuccessUS =
                              await actions.connectAppleHealth(
                            (currentUserDocument?.dataTypesToDownload
                                        .toList() ??
                                    [])
                                .toList(),
                          );
                          shouldSetState = true;
                          if (_model.appleHealthSuccessUS!) {
                            logFirebaseEvent('Button_custom_action');
                            _model.appleHealthData =
                                await actions.getDataAppleHealth(
                              currentUserDocument!.lastDataFetch! >
                                      dateTimeFromSecondsSinceEpoch(
                                          getCurrentTimestamp
                                                  .secondsSinceEpoch -
                                              5259487)
                                  ? dateTimeFromSecondsSinceEpoch(
                                      currentUserDocument!.lastDataFetch!
                                              .secondsSinceEpoch -
                                          172800)
                                  : dateTimeFromSecondsSinceEpoch(
                                      getCurrentTimestamp.secondsSinceEpoch -
                                          5259487),
                              getCurrentTimestamp,
                              valueOrDefault(
                                  currentUserDocument?.timezoneOffset, 0),
                              (currentUserDocument?.dataTypesToDownload
                                          .toList() ??
                                      [])
                                  .toList(),
                              currentUserReference!,
                              true,
                            );
                            shouldSetState = true;
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              trackerLinked: true,
                              appleHealthLinked: true,
                              lastDataFetch: getCurrentTimestamp,
                            ));
                          } else {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Connection unsuccessful. Please try again.',
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
                                duration: const Duration(milliseconds: 2000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                            if (shouldSetState) safeSetState(() {});
                            return;
                          }

                          logFirebaseEvent('Button_firestore_query');
                          _model.paData = await queryPaDataRecordOnce(
                            parent: currentUserReference,
                            queryBuilder: (paDataRecord) => paDataRecord
                                .where(
                                  'data_type',
                                  isEqualTo: 'daily',
                                )
                                .orderBy('event_date', descending: true),
                            limit: 60,
                          );
                          shouldSetState = true;
                          logFirebaseEvent('Button_update_page_state');
                          _model.hiResults = functions.habitIndex(
                              _model.paData?.toList(),
                              4,
                              3,
                              4,
                              1000,
                              12500,
                              6,
                              valueOrDefault(
                                  currentUserDocument?.timezoneOffset, 0));
                          safeSetState(() {});
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            stepGoalLow: valueOrDefault<int>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.threshold''',
                              ),
                              0,
                            ),
                          ));
                          logFirebaseEvent('Button_update_page_state');
                          _model.hiResults = functions.habitIndex(
                              _model.paData?.toList(),
                              2,
                              1,
                              2,
                              1000,
                              12500,
                              6,
                              valueOrDefault(
                                  currentUserDocument?.timezoneOffset, 0));
                          safeSetState(() {});
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            stepGoalAdvanced: valueOrDefault<int>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.threshold''',
                              ),
                              0,
                            ),
                          ));
                          logFirebaseEvent('Button_update_page_state');
                          _model.hiResults = functions.habitIndex(
                              _model.paData?.toList(),
                              4,
                              1,
                              2,
                              1000,
                              12500,
                              6,
                              valueOrDefault(
                                  currentUserDocument?.timezoneOffset, 0));
                          safeSetState(() {});
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            stepGoalStandard: valueOrDefault<int>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.threshold''',
                              ),
                              0,
                            ),
                            hiFreqValue: valueOrDefault<int>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.freq''',
                              ),
                              0,
                            ),
                            hiDays: valueOrDefault<int>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.days''',
                              ),
                              0,
                            ),
                            hiThreshold: valueOrDefault<int>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.threshold''',
                              ),
                              0,
                            ),
                            hiError: valueOrDefault<String>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.error''',
                              )?.toString(),
                              'NULL',
                            ),
                            hiConsistency: valueOrDefault<double>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.consistency''',
                              ),
                              0.0,
                            ),
                            hiExposure: valueOrDefault<int>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.exposure''',
                              ),
                              0,
                            ),
                            hiDaysTracked: valueOrDefault<int>(
                              getJsonField(
                                _model.hiResults,
                                r'''$.days_tracked''',
                              ),
                              0,
                            ),
                          ));
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('onboarding_05');

                          if (shouldSetState) safeSetState(() {});
                        },
                        text: 'Connect now',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 25.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
