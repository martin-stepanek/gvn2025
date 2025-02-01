import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'communication_intro_model.dart';
export 'communication_intro_model.dart';

class CommunicationIntroWidget extends StatefulWidget {
  const CommunicationIntroWidget({super.key});

  @override
  State<CommunicationIntroWidget> createState() =>
      _CommunicationIntroWidgetState();
}

class _CommunicationIntroWidgetState extends State<CommunicationIntroWidget> {
  late CommunicationIntroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunicationIntroModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'communication_intro'});
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
              logFirebaseEvent('COMMUNICATION_INTRO_Icon_ruw9ifgc_ON_TAP');
              logFirebaseEvent('Icon_navigate_back');
              context.safePop();
            },
            child: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 22.0,
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your communication preferences',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'How frequently would you like to receive notifications?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FlutterFlowRadioButton(
                                            options: [
                                              'Only when necessary',
                                              'Occasionally; to remind me of key activities',
                                              'Often; to help me build healthy habits'
                                            ].toList(),
                                            onChanged: (val) =>
                                                safeSetState(() {}),
                                            controller: _model
                                                    .frequencyValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            optionHeight: 32.0,
                                            optionWidth:
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.8,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            selectedTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.vertical,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveRadioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            toggleable: false,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(height: 10.0)),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Would you like your in-app communication to be more formal or casual?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Casual',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                        Text(
                                                          'Formal',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  40.0,
                                                                  0.0,
                                                                  40.0,
                                                                  0.0),
                                                      child: Slider(
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        inactiveColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        min: 1.0,
                                                        max: 5.0,
                                                        value: _model
                                                            .toneValue ??= 1.0,
                                                        divisions: 4,
                                                        onChanged: (newValue) {
                                                          safeSetState(() =>
                                                              _model.toneValue =
                                                                  newValue);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: () {
                                                          if (_model
                                                                  .toneValue ==
                                                              1.0) {
                                                            return 'Very casual';
                                                          } else if (_model
                                                                  .toneValue ==
                                                              2.0) {
                                                            return 'Quite casual';
                                                          } else if (_model
                                                                  .toneValue ==
                                                              3.0) {
                                                            return 'Neutral';
                                                          } else if (_model
                                                                  .toneValue ==
                                                              4.0) {
                                                            return 'Quite formal';
                                                          } else if (_model
                                                                  .toneValue ==
                                                              5.0) {
                                                            return 'Very formal';
                                                          } else {
                                                            return 'Please select';
                                                          }
                                                        }(),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 10.0)),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Which of the following characterise you?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          Text(
                                            'Select all that apply',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: FlutterFlowChoiceChips(
                                              options: const [
                                                ChipData('Outgoing',
                                                    Icons.groups_rounded),
                                                ChipData('Pessimistic',
                                                    Icons.mood_bad_sharp),
                                                ChipData('Family-oriented',
                                                    Icons.family_restroom),
                                                ChipData('Adventure-seeking',
                                                    Icons.trolley),
                                                ChipData('Cynical',
                                                    Icons.face_6_rounded),
                                                ChipData('Health-concious',
                                                    Icons.favorite_sharp),
                                                ChipData('Analytical',
                                                    Icons.calculate),
                                                ChipData('Empathetic',
                                                    Icons.hearing),
                                                ChipData('Introverted',
                                                    Icons.location_history)
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                      .personalityValues = val),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                iconSize: 18.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 18.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              chipSpacing: 12.0,
                                              rowSpacing: 12.0,
                                              multiselect: true,
                                              initialized:
                                                  _model.personalityValues !=
                                                      null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .personalityValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Would you prefer getting £100 now or £150 next month?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowRadioButton(
                                          options: [
                                            '£100 now',
                                            'I don\'t have a preference',
                                            '£150 next month'
                                          ].toList(),
                                          onChanged: (val) =>
                                              safeSetState(() {}),
                                          controller: _model
                                                  .timeDiscountingValueController ??=
                                              FormFieldController<String>(null),
                                          optionHeight: 32.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          selectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily),
                                                  ),
                                          buttonPosition:
                                              RadioButtonPosition.left,
                                          direction: Axis.vertical,
                                          radioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveRadioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          toggleable: false,
                                          horizontalAlignment:
                                              WrapAlignment.start,
                                          verticalAlignment:
                                              WrapCrossAlignment.start,
                                        ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(height: 10.0)),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'What motivates you more in achieving your health goals?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          FlutterFlowRadioButton(
                                            options: [
                                              'Fear of negative consequences if I don\'t take action',
                                              'The potential rewards and benefits I will gain',
                                              'Knowing that others are successfully achieving similar goals'
                                            ].toList(),
                                            onChanged: (val) =>
                                                safeSetState(() {}),
                                            controller: _model
                                                    .motivationValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            optionHeight: 40.0,
                                            optionWidth:
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.8,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            selectedTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.vertical,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveRadioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            toggleable: false,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ].divide(const SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 15.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: ((_model.frequencyValue == null ||
                              _model.frequencyValue == '') ||
                          !(_model.personalityValues != null &&
                              (_model.personalityValues)!.isNotEmpty) ||
                          (_model.toneValue == null) ||
                          (_model.timeDiscountingValue == null ||
                              _model.timeDiscountingValue == '') ||
                          (_model.motivationValue == null ||
                              _model.motivationValue == ''))
                      ? null
                      : () async {
                          logFirebaseEvent(
                              'COMMUNICATION_INTRO_PAGE_Next_ON_TAP');
                          var shouldSetState = false;
                          logFirebaseEvent('Next_backend_call');

                          await currentUserReference!.update({
                            ...createUsersRecordData(
                              notificationsFormality: () {
                                if (_model.toneValue == 1.0) {
                                  return 'Very casual';
                                } else if (_model.toneValue == 2.0) {
                                  return 'Quite casual';
                                } else if (_model.toneValue == 3.0) {
                                  return 'Neutral';
                                } else if (_model.toneValue == 4.0) {
                                  return 'Quite formal';
                                } else if (_model.toneValue == 5.0) {
                                  return 'Very formal';
                                } else {
                                  return 'Please select';
                                }
                              }(),
                              notificationsFrequency: _model.frequencyValue,
                              notificationsTimeDiscounting:
                                  _model.timeDiscountingValue,
                              notificationsMotivation: _model.motivationValue,
                            ),
                            ...mapToFirestore(
                              {
                                'notifications_personality':
                                    _model.personalityValues,
                              },
                            ),
                          });
                          logFirebaseEvent('Next_firestore_query');
                          _model.notifications =
                              await queryNotificationsRecordOnce(
                            parent: currentUserReference,
                          );
                          shouldSetState = true;
                          logFirebaseEvent('Next_update_page_state');
                          _model.index = 0;
                          safeSetState(() {});
                          while (_model.index < _model.notifications!.length) {
                            logFirebaseEvent('Next_backend_call');
                            await _model.notifications!
                                .elementAtOrNull(_model.index)!
                                .reference
                                .delete();
                            logFirebaseEvent('Next_update_page_state');
                            _model.index = _model.index + 1;
                            safeSetState(() {});
                          }
                          logFirebaseEvent('Next_firestore_query');
                          _model.paData = await queryPaDataRecordOnce(
                            parent: currentUserReference,
                            queryBuilder: (paDataRecord) => paDataRecord
                                .where(
                                  'data_type',
                                  isEqualTo: 'daily',
                                )
                                .orderBy('event_date', descending: true),
                            limit: 30,
                          );
                          shouldSetState = true;
                          logFirebaseEvent('Next_backend_call');
                          _model.personalitySummary =
                              await OpenAIGroup.foodAnalysisCall.call(
                            model: 'gpt-4o-mini',
                            messagesJson: functions.openAiPersonalitySummary(
                                valueOrDefault(currentUserDocument?.age, 0.0),
                                currentUserDocument!.gender!,
                                valueOrDefault(currentUserDocument?.bmi, 0.0),
                                () {
                                  if (currentUserDocument?.smoking ==
                                      Smoking.current) {
                                    return 'current smoker';
                                  } else if (currentUserDocument?.smoking ==
                                      Smoking.past) {
                                    return 'past smoker';
                                  } else if (currentUserDocument?.smoking ==
                                      Smoking.never) {
                                    return 'never smoked';
                                  } else {
                                    return 'unknown';
                                  }
                                }(),
                                (currentUserDocument?.conditions.toList() ??
                                        [])
                                    .toList(),
                                valueOrDefault<double>(
                                  functions
                                      .getAverageSteps(_model.paData?.toList())
                                      .toDouble(),
                                  9999.0,
                                ),
                                valueOrDefault(
                                        currentUserDocument
                                            ?.moderateActivityDays,
                                        0) +
                                    valueOrDefault(
                                        currentUserDocument
                                            ?.vigorousActivityDays,
                                        0),
                                () {
                                  if (valueOrDefault(
                                          currentUserDocument?.mhMood, 0) ==
                                      1) {
                                    return 'very good';
                                  } else if (valueOrDefault(
                                          currentUserDocument?.mhMood, 0) ==
                                      2) {
                                    return 'good';
                                  } else if (valueOrDefault(
                                          currentUserDocument?.mhMood, 0) ==
                                      3) {
                                    return 'fair';
                                  } else if (valueOrDefault(
                                          currentUserDocument?.mhMood, 0) ==
                                      4) {
                                    return 'poor';
                                  } else if (valueOrDefault(
                                          currentUserDocument?.mhMood, 0) ==
                                      5) {
                                    return 'very poor';
                                  } else {
                                    return 'unknown';
                                  }
                                }(),
                                currentUserDisplayName,
                                (currentUserDocument?.vitalityObjectives
                                            .toList() ??
                                        [])
                                    .toList(),
                                functions
                                    .getAverageSleep(_model.paData?.toList()),
                                valueOrDefault(
                                    currentUserDocument?.notificationsFormality,
                                    ''),
                                valueOrDefault(
                                    currentUserDocument?.notificationsFrequency,
                                    ''),
                                valueOrDefault(
                                    currentUserDocument
                                        ?.notificationsMotivation,
                                    ''),
                                valueOrDefault(
                                    currentUserDocument
                                        ?.notificationsTimeDiscounting,
                                    ''),
                                (currentUserDocument?.notificationsPersonality
                                            .toList() ??
                                        [])
                                    .toList()),
                          );

                          shouldSetState = true;
                          if ((_model.personalitySummary?.succeeded ?? true)) {
                            logFirebaseEvent('Next_backend_call');

                            await currentUserReference!.update({
                              ...createUsersRecordData(
                                notificationsSummary: functions.openAiOutput(
                                    OpenAIGroup.foodAnalysisCall
                                        .content(
                                          (_model.personalitySummary
                                                  ?.jsonBody ??
                                              ''),
                                        )
                                        .toString(),
                                    'summary'),
                                communicationTypeLossAversion: 0.25,
                                communicationTypeSocialProofing: 0.25,
                                communicationTypeHyperbolicDiscounting: 0.25,
                                communicationTypeAnchoring: 0.25,
                              ),
                              ...mapToFirestore(
                                {
                                  'communication_current_types':
                                      NotificationType.values
                                          .map((e) => e.serialize())
                                          .toList(),
                                  'communication_current_times':
                                      NotificationTime.values
                                          .map((e) => e.serialize())
                                          .toList(),
                                },
                              ),
                            });
                            logFirebaseEvent('Next_navigate_to');

                            context.pushNamed('communication');

                            if (shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            logFirebaseEvent('Next_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'API error: ${(_model.personalitySummary?.exceptionMessage ?? '')}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
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

                          if (shouldSetState) safeSetState(() {});
                        },
                  text: 'Continue',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(32.0),
                    disabledColor: FlutterFlowTheme.of(context).secondary,
                    disabledTextColor: FlutterFlowTheme.of(context).lightGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
