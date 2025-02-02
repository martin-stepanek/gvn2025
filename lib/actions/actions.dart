import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future nbaAdd(
  BuildContext context, {
  NbaRecord? nba,
  String? name,
  DateTime? completeBy,
}) async {
  logFirebaseEvent('nbaAdd_backend_call');

  await currentUserReference!.update({
    ...createUsersRecordData(
      homepageMessageUpdated: true,
    ),
    ...mapToFirestore(
      {
        'nba_available': FieldValue.arrayRemove([nba?.reference]),
        'nba_active': FieldValue.arrayUnion([nba?.reference]),
      },
    ),
  });
  logFirebaseEvent('nbaAdd_backend_call');

  await nba!.reference.update(createNbaRecordData(
    available: false,
  ));
  logFirebaseEvent('nbaAdd_backend_call');

  await CoachMessagesRecord.createDoc(currentUserReference!)
      .set(createCoachMessagesRecordData(
    createdAt: getCurrentTimestamp,
    title: 'Coach Jonny here, you have new goal.',
    text: valueOrDefault<String>(
      name,
      'NULL',
    ),
    link: '',
    showFrom: getCurrentTimestamp,
    showUntil: getCurrentTimestamp,
    show: true,
    assessment: '',
  ));
}

Future nbaSelect(
  BuildContext context, {
  NbaRecord? nba,
  required List<PaDataRecord>? paData,
}) async {
  if (nba?.type == Nba.pa_steps_days) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: functions.replaceString(
          nba.name,
          valueOrDefault<String>(
            formatNumber(
              functions.getAverageSteps(paData?.toList()),
              formatType: FormatType.custom,
              format: '###,###',
              locale: '',
            ),
            '99999',
          ),
          '3',
          ' '),
      active: true,
      progressIntTotal: 3,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      targetInt: valueOrDefault<int>(
        functions.getAverageSteps(paData?.toList()),
        99999,
      ),
      available: false,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: functions.replaceString(
          nba.name,
          valueOrDefault<String>(
            formatNumber(
              functions.getAverageSteps(paData?.toList()),
              formatType: FormatType.custom,
              format: '###,###',
              locale: '',
            ),
            '99999',
          ),
          '3',
          ' '),
      completeBy: functions.endOfNextWeek(),
    );
  } else if (nba?.type == Nba.hr_min_days) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: functions.replaceString(nba.name, '30', ' 300', ' 3'),
      active: true,
      progressIntTotal: 3,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      available: false,
      targetInt: 30,
      targetInt2: 300,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: functions.replaceString(nba.name, '30', ' 300', ' 3'),
      completeBy: functions.endOfNextWeek(),
    );
  } else if (nba?.type == Nba.sleep_regularity_start) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: functions.replaceString(
          nba.name,
          valueOrDefault<String>(
            '${(functions.getAverageSleepTimeStart(paData?.toList()) ~/ 60).toString()}:${formatNumber(
              functions.getAverageSleepTimeStart(paData?.toList()) % 60,
              formatType: FormatType.custom,
              format: '00',
              locale: '',
            )}—${((functions.getAverageSleepTimeStart(paData?.toList()) + 30) ~/ 60).toString()}:${formatNumber(
              (functions.getAverageSleepTimeStart(paData?.toList()) + 30) % 60,
              formatType: FormatType.custom,
              format: '00',
              locale: '',
            )}',
            'NULL',
          ),
          '3',
          ' '),
      active: true,
      progressIntTotal: 3,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      targetInt: valueOrDefault<int>(
        functions.getAverageSleepTimeStart(paData?.toList()),
        600,
      ),
      targetInt2: valueOrDefault<int>(
        valueOrDefault<int>(
              functions.getAverageSleepTimeStart(paData?.toList()),
              600,
            ) +
            30,
        630,
      ),
      available: false,
    ));
    logFirebaseEvent('nbaSelect_backend_call');

    await currentUserReference!.update(createUsersRecordData(
      nbaSleepCheck: true,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: functions.replaceString(
          nba.name,
          valueOrDefault<String>(
            '${(functions.getAverageSleepTimeStart(paData?.toList()) ~/ 60).toString()}:${formatNumber(
              functions.getAverageSleepTimeStart(paData?.toList()) % 60,
              formatType: FormatType.custom,
              format: '00',
              locale: '',
            )}—${((functions.getAverageSleepTimeStart(paData?.toList()) + 30) ~/ 60).toString()}:${formatNumber(
              (functions.getAverageSleepTimeStart(paData?.toList()) + 30) % 60,
              formatType: FormatType.custom,
              format: '00',
              locale: '',
            )}',
            'NULL',
          ),
          '3',
          ' '),
      completeBy: functions.endOfNextWeek(),
    );
  } else if (nba?.type == Nba.nutrition_picture_lunch) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: functions.replaceString(nba.name, '3', ' ', ' '),
      active: true,
      progressIntTotal: 3,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      available: false,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: functions.replaceString(nba.name, '3', ' ', ' '),
      completeBy: functions.endOfNextWeek(),
    );
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.generateRecipes(context);
  } else if (nba?.type == Nba.nutrition_picture_ingredient) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: functions.replaceString(nba.name, '3', '1', 'vegetable'),
      active: true,
      progressIntTotal: 3,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      available: false,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: functions.replaceString(nba.name, '3', '1', ' vegetable'),
      completeBy: functions.endOfNextWeek(),
    );
    logFirebaseEvent('nbaSelect_backend_call');

    await currentUserReference!.update(createUsersRecordData(
      foodExtraGoalUpdate: false,
      foodExtraGoal: 'vegetable as a side dish',
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.generateRecipes(context);
  } else if (nba?.type == Nba.stand_hours_days) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: functions.replaceString(nba.name, '5', '3', ' '),
      active: true,
      progressIntTotal: 3,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      available: false,
      targetInt: 5,
      targetInt2: 3,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: functions.replaceString(nba.name, '5', '3', ' '),
      completeBy: functions.endOfNextWeek(),
    );
  } else if (nba?.type == Nba.face_scan) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: functions.replaceString(nba.name, 'a', 'face scan', ' '),
      active: true,
      progressIntTotal: 1,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      available: false,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: functions.replaceString(nba.name, 'a', ' ', ' '),
      completeBy: functions.endOfNextWeek(),
    );
  } else if (nba?.type == Nba.mental_wellbeing_assessment) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: functions.replaceString(nba.name, '3', ' ', ' '),
      active: true,
      progressIntTotal: 3,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      available: false,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: functions.replaceString(nba.name, '3', ' ', ' '),
      completeBy: functions.endOfNextWeek(),
    );
  } else if (nba?.type == Nba.healthy_futures) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: nba.name,
      active: true,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      available: false,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: nba.name,
      completeBy: functions.endOfNextWeek(),
    );
  } else if (nba?.type == Nba.medication_adherence) {
    logFirebaseEvent('nbaSelect_backend_call');

    await nba!.reference.update(createNbaRecordData(
      name: nba.name,
      active: true,
      startedAt: functions.getDay(getCurrentTimestamp, -1,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
      completeBy: functions.endOfNextWeek(),
      available: false,
    ));
    logFirebaseEvent('nbaSelect_action_block');
    await action_blocks.nbaAdd(
      context,
      nba: nba,
      name: nba.name,
      completeBy: functions.endOfNextWeek(),
    );
  }
}

Future generateRecipes(BuildContext context) async {
  ApiCallResponse? recipes;

  logFirebaseEvent('generateRecipes_show_snack_bar');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Generating recipes...',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).info,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
      ),
      duration: const Duration(milliseconds: 99999),
      backgroundColor: FlutterFlowTheme.of(context).primaryText,
    ),
  );
  logFirebaseEvent('generateRecipes_backend_call');
  recipes = await OpenAIGroup.foodAnalysisCall.call(
    model: 'gpt-4o',
    messagesJson: functions.openAiGenerateMealplan(),
  );

  if ((recipes.succeeded ?? true)) {
    logFirebaseEvent('generateRecipes_update_app_state');
    FFAppState().mealSuggestions = functions
        .jsonArraytoJSONlist(OpenAIGroup.foodAnalysisCall
            .content(
              (recipes.jsonBody ?? ''),
            )
            .toString())!
        .toList()
        .cast<dynamic>();
    FFAppState().index = 0;
    while (FFAppState().index < FFAppState().mealSuggestions.length) {
      logFirebaseEvent('generateRecipes_backend_call');

      await MealplanRecord.createDoc(currentUserReference!)
          .set(createMealplanRecordData(
        createdAt: getCurrentTimestamp,
        name: getJsonField(
          FFAppState().mealSuggestions.elementAtOrNull(FFAppState().index),
          r'''$.name''',
        ).toString().toString(),
        calories: getJsonField(
          FFAppState().mealSuggestions.elementAtOrNull(FFAppState().index),
          r'''$.calories''',
        ),
        prepTimeMin: getJsonField(
          FFAppState().mealSuggestions.elementAtOrNull(FFAppState().index),
          r'''$.prep_time''',
        ),
        ingredientsSingleString: getJsonField(
          FFAppState().mealSuggestions.elementAtOrNull(FFAppState().index),
          r'''$.ingredients''',
        ).toString().toString(),
      ));
      logFirebaseEvent('generateRecipes_update_app_state');
      FFAppState().index = FFAppState().index + 1;
    }
    logFirebaseEvent('generateRecipes_hide_snack_bar');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  } else {
    logFirebaseEvent('generateRecipes_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'API error: ${(recipes.statusCode ?? 200).toString()}',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
              ),
        ),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
      ),
    );
    return;
  }
}

Future nbaNew(
  BuildContext context, {
  required NbaRecord? nbaCompleted,
  required List<NbaRecord>? nbaAvailable,
  required List<PaDataRecord>? paData,
}) async {
  logFirebaseEvent('nbaNew_backend_call');

  await nbaCompleted!.reference.update(createNbaRecordData(
    active: false,
    done: true,
    completedAt: getCurrentTimestamp,
  ));
  logFirebaseEvent('nbaNew_backend_call');

  await currentUserReference!.update({
    ...mapToFirestore(
      {
        'nba_active': FieldValue.arrayRemove([nbaCompleted.reference]),
      },
    ),
  });
  if (nbaAvailable!
          .where((e) => e.activity == nbaCompleted.activity)
          .toList().isNotEmpty) {
    logFirebaseEvent('nbaNew_action_block');
    await action_blocks.nbaSelect(
      context,
      nba: nbaAvailable
          .where((e) => e.activity == nbaCompleted.activity)
          .toList()
          .firstOrNull,
      paData: paData,
    );
  } else {
    logFirebaseEvent('nbaNew_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'There are no more available actions.',
          style: TextStyle(),
        ),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
      ),
    );
  }
}

Future hfFeedback(BuildContext context) async {
  HfRecord? hfData;
  List<PaDataRecord>? paData;
  HfRecord? hfData2;
  HfRecord? hfData3;

  logFirebaseEvent('hfFeedback_backend_call');
  hfData = await HfRecord.getDocumentOnce(currentUserDocument!.hfRef!);
  logFirebaseEvent('hfFeedback_firestore_query');
  paData = await queryPaDataRecordOnce(
    parent: currentUserReference,
    queryBuilder: (paDataRecord) => paDataRecord.where(
      'event_date',
      isGreaterThan: functions.getDay(getCurrentTimestamp, -14,
          valueOrDefault(currentUserDocument?.timezoneOffset, 0)),
    ),
  );
  logFirebaseEvent('hfFeedback_backend_call');

  await currentUserDocument!.hfRef!.update(createHfRecordData(
    bmi: valueOrDefault(currentUserDocument?.bmi, 0.0),
    smoking: currentUserDocument?.smoking,
    steps: functions.getAverageStepsExact(paData.toList()).toString() != '0'
        ? functions.getAverageStepsExact(paData.toList())
        : 9999,
    calories: functions.getAverageActiveCalories(paData.toList()) != 0
        ? functions.getAverageActiveCalories(paData.toList())
        : 9999,
    hrv: () {
      if (functions.getAverageHrv(paData?.toList()).toString() != '0') {
        return functions.getAverageHrv(paData?.toList());
      } else if ((valueOrDefault(currentUserDocument?.hrv, 0.0) != null) &&
          (valueOrDefault(currentUserDocument?.hrv, 0.0) != 0.0)) {
        return valueOrDefault(currentUserDocument?.hrv, 0.0);
      } else {
        return 9999.0;
      }
    }(),
    rhr: () {
      if (functions.getAverageRhr(paData?.toList()).toString() != '0') {
        return functions.getAverageRhr(paData?.toList());
      } else if ((valueOrDefault(currentUserDocument?.rhr, 0) != null) &&
          (valueOrDefault(currentUserDocument?.rhr, 0) != 0)) {
        return valueOrDefault(currentUserDocument?.rhr, 0);
      } else {
        return 9999;
      }
    }(),
    vo2max: functions.getAverageVo2max(paData.toList()).toString() != '0'
        ? functions.getAverageVo2max(paData.toList())
        : 9999,
    sleep: functions.getAverageSleep(paData.toList()),
    paDays: valueOrDefault(currentUserDocument?.moderateActivityDays, 0) +
        valueOrDefault(currentUserDocument?.vigorousActivityDays, 0),
    hrvUnit: () {
      if (functions.getAverageHrv(paData?.toList()).toString() != '0') {
        return 'SDNN';
      } else if ((valueOrDefault(currentUserDocument?.hrv, 0.0) != null) &&
          (valueOrDefault(currentUserDocument?.hrv, 0.0) != 0.0)) {
        return 'SDNN';
      } else {
        return 'NULL';
      }
    }(),
  ));
  logFirebaseEvent('hfFeedback_backend_call');
  hfData2 = await HfRecord.getDocumentOnce(currentUserDocument!.hfRef!);
  logFirebaseEvent('hfFeedback_backend_call');

  await currentUserDocument!.hfRef!.update(createHfRecordData(
    stepsClass: () {
      if (hfData2?.steps == 9999) {
        return 'Unknown';
      } else if (hfData2!.steps > 7500) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    rhrClass: () {
      if (hfData2?.rhr == 9999) {
        return 'Unknown';
      } else if (hfData2!.rhr < 70) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    hrvClass: () {
      if (hfData2?.hrv == 9999.0) {
        return 'Unknown';
      } else if (hfData2!.hrv > 93.0) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    vo2maxClass: () {
      if (hfData2?.vo2max == 9999) {
        return 'Unknown';
      } else if (hfData2!.vo2max > 35) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    caloriesClass: () {
      if (hfData2?.calories == 9999) {
        return 'Unknown';
      } else if (hfData2!.calories > 300) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    sleepClass: () {
      if (hfData2?.sleep == 9999.0) {
        return 'Unknown';
      } else if ((hfData2!.sleep >= 7.0) && (hfData2.sleep <= 9.0)) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    paClass: () {
      if (hfData2?.paDays == 9999) {
        return 'Unknown';
      } else if (hfData2!.paDays > 2) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    bmiClass: () {
      if ((hfData2?.bmi == 9999.0) || (hfData2?.bmi == 0.0)) {
        return 'Unknown';
      } else if ((hfData2!.bmi > 18.0) && (hfData2.bmi <= 25.0)) {
        return 'Healthy';
      } else if ((hfData2.bmi > 25.0) && (hfData2.bmi <= 30.0)) {
        return 'Moderate';
      } else {
        return 'High';
      }
    }(),
    cholClass: () {
      if ((hfData2?.chol == 9999.0) && (hfData?.cholClass == 'Normal')) {
        return 'Healthy';
      } else if ((hfData2?.chol == 9999.0) && (hfData?.cholClass == 'High')) {
        return 'High';
      } else if ((hfData2?.chol == 9999.0) &&
          (hfData?.cholClass == 'Don\'t know')) {
        return 'Unknown';
      } else if (hfData2!.chol < 5.0) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    glucClass: () {
      if ((hfData2?.gluc == 9999.0) && (hfData2?.glucClass == 'Normal')) {
        return 'Healthy';
      } else if ((hfData2?.gluc == 9999.0) && (hfData2?.glucClass == 'High')) {
        return 'High';
      } else if ((hfData2?.gluc == 9999.0) &&
          (hfData2?.glucClass == 'Don\'t know')) {
        return 'Unknown';
      } else if (hfData2!.gluc < 5.6) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    bpClass: () {
      if (((hfData2?.bpSys == 9999) || (hfData2?.bpDia == 9999)) &&
          (hfData?.bpClass == 'Low')) {
        return 'Healthy';
      } else if (((hfData2?.bpSys == 9999) || (hfData2?.bpDia == 9999)) &&
          (hfData?.bpClass == 'Don\'t know')) {
        return 'Unknown';
      } else if (((hfData2?.bpSys == 9999) || (hfData2?.bpDia == 9999)) &&
          (hfData?.bpClass == 'Normal')) {
        return 'Healthy';
      } else if (((hfData2?.bpSys == 9999) || (hfData2?.bpDia == 9999)) &&
          (hfData?.bpClass == 'High')) {
        return 'High';
      } else if ((hfData2!.bpSys <= 120) && (hfData2.bpDia <= 80)) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    alcClass: () {
      if (hfData2?.alcohol == 9999) {
        return 'Unknown';
      } else if (hfData2!.alcohol <= 7) {
        return 'Healthy';
      } else {
        return 'High';
      }
    }(),
    nutritionClass: ((hfData2.nutritionFastFood == DietFrequency.Never) ||
                (hfData2.nutritionFastFood == DietFrequency.Sometimes)) &&
            ((hfData2.nutritionRedMeat == DietFrequency.Never) ||
                (hfData2.nutritionRedMeat == DietFrequency.Sometimes)) &&
            ((hfData2.nutritionFruit == DietFrequency.Often) ||
                (hfData2.nutritionFruit == DietFrequency.Always))
        ? 'Healthy'
        : 'High',
  ));
  logFirebaseEvent('hfFeedback_backend_call');
  hfData3 = await HfRecord.getDocumentOnce(currentUserDocument!.hfRef!);
  logFirebaseEvent('hfFeedback_backend_call');

  await currentUserDocument!.hfRef!.update(createHfRecordData(
    countHealthy: valueOrDefault<int>(
          () {
            if (hfData3?.stepsClass == 'Healthy') {
              return 1;
            } else if (hfData3?.stepsClass == 'Moderate') {
              return 0;
            } else if (hfData3?.stepsClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.caloriesClass == 'Healthy') {
              return 1;
            } else if (hfData3?.caloriesClass == 'Moderate') {
              return 0;
            } else if (hfData3?.caloriesClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.vo2maxClass == 'Healthy') {
              return 1;
            } else if (hfData3?.vo2maxClass == 'Moderate') {
              return 0;
            } else if (hfData3?.vo2maxClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.hrvClass == 'Healthy') {
              return 1;
            } else if (hfData3?.hrvClass == 'Moderate') {
              return 0;
            } else if (hfData3?.hrvClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.rhrClass == 'Healthy') {
              return 1;
            } else if (hfData3?.rhrClass == 'Moderate') {
              return 0;
            } else if (hfData3?.rhrClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.sleepClass == 'Healthy') {
              return 1;
            } else if (hfData3?.sleepClass == 'Moderate') {
              return 0;
            } else if (hfData3?.sleepClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.paClass == 'Healthy') {
              return 1;
            } else if (hfData3?.paClass == 'Moderate') {
              return 0;
            } else if (hfData3?.paClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.bpClass == 'Healthy') {
              return 1;
            } else if (hfData3?.bpClass == 'Moderate') {
              return 0;
            } else if (hfData3?.bpClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.cholClass == 'Healthy') {
              return 1;
            } else if (hfData3?.cholClass == 'Moderate') {
              return 0;
            } else if (hfData3?.cholClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.glucClass == 'Healthy') {
              return 1;
            } else if (hfData3?.glucClass == 'Moderate') {
              return 0;
            } else if (hfData3?.glucClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.bmiClass == 'Healthy') {
              return 1;
            } else if (hfData3?.bmiClass == 'Moderate') {
              return 0;
            } else if (hfData3?.bmiClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.nutritionClass == 'Healthy') {
              return 1;
            } else if (hfData3?.nutritionClass == 'Moderate') {
              return 0;
            } else if (hfData3?.nutritionClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.alcClass == 'Healthy') {
              return 1;
            } else if (hfData3?.alcClass == 'Moderate') {
              return 0;
            } else if (hfData3?.alcClass == 'High') {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.smoking == Smoking.current) {
              return 0;
            } else if (hfData3?.smoking == Smoking.past) {
              return 0;
            } else if (hfData3?.smoking == Smoking.never) {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ),
    countUnhealthy: valueOrDefault<int>(
          () {
            if (hfData3?.stepsClass == 'Healthy') {
              return 0;
            } else if (hfData3?.stepsClass == 'Moderate') {
              return 1;
            } else if (hfData3?.stepsClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.caloriesClass == 'Healthy') {
              return 0;
            } else if (hfData3?.caloriesClass == 'Moderate') {
              return 1;
            } else if (hfData3?.caloriesClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.vo2maxClass == 'Healthy') {
              return 0;
            } else if (hfData3?.vo2maxClass == 'Moderate') {
              return 1;
            } else if (hfData3?.vo2maxClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.hrvClass == 'Healthy') {
              return 0;
            } else if (hfData3?.hrvClass == 'Moderate') {
              return 1;
            } else if (hfData3?.hrvClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.rhrClass == 'Healthy') {
              return 0;
            } else if (hfData3?.rhrClass == 'Moderate') {
              return 1;
            } else if (hfData3?.rhrClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.sleepClass == 'Healthy') {
              return 0;
            } else if (hfData3?.sleepClass == 'Moderate') {
              return 1;
            } else if (hfData3?.sleepClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.paClass == 'Healthy') {
              return 0;
            } else if (hfData3?.paClass == 'Moderate') {
              return 1;
            } else if (hfData3?.paClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.bpClass == 'Healthy') {
              return 0;
            } else if (hfData3?.bpClass == 'Moderate') {
              return 1;
            } else if (hfData3?.bpClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.cholClass == 'Healthy') {
              return 0;
            } else if (hfData3?.cholClass == 'Moderate') {
              return 1;
            } else if (hfData3?.cholClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.glucClass == 'Healthy') {
              return 0;
            } else if (hfData3?.glucClass == 'Moderate') {
              return 1;
            } else if (hfData3?.glucClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.bmiClass == 'Healthy') {
              return 0;
            } else if (hfData3?.bmiClass == 'Moderate') {
              return 1;
            } else if (hfData3?.bmiClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.nutritionClass == 'Healthy') {
              return 0;
            } else if (hfData3?.nutritionClass == 'Moderate') {
              return 1;
            } else if (hfData3?.nutritionClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.alcClass == 'Healthy') {
              return 0;
            } else if (hfData3?.alcClass == 'Moderate') {
              return 1;
            } else if (hfData3?.alcClass == 'High') {
              return 1;
            } else {
              return 0;
            }
          }(),
          0,
        ) +
        valueOrDefault<int>(
          () {
            if (hfData3?.smoking == Smoking.current) {
              return 1;
            } else if (hfData3?.smoking == Smoking.past) {
              return 1;
            } else if (hfData3?.smoking == Smoking.never) {
              return 0;
            } else {
              return 0;
            }
          }(),
          0,
        ),
  ));
  logFirebaseEvent('hfFeedback_backend_call');

  await currentUserReference!.update(createUsersRecordData(
    healthFeedbackAvailable: true,
  ));
}

Future nbaGenerateFeedback(
  BuildContext context, {
  required NbaRecord? nba,
}) async {
  ApiCallResponse? response;

  logFirebaseEvent('nbaGenerateFeedback_show_snack_bar');
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Generating summary assessment...',
        style: FlutterFlowTheme.of(context).bodyLarge.override(
              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
              color: FlutterFlowTheme.of(context).info,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
            ),
      ),
      duration: const Duration(milliseconds: 20000),
      backgroundColor: FlutterFlowTheme.of(context).primaryText,
    ),
  );
  logFirebaseEvent('nbaGenerateFeedback_backend_call');
  response = await OpenAIGroup.foodAnalysisCall.call(
    model: 'gpt-4o',
    messagesJson: functions.openAiNbaSummary(nba!),
  );

  if ((response.succeeded ?? true)) {
    logFirebaseEvent('nbaGenerateFeedback_hide_snack_bar');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  } else {
    logFirebaseEvent('nbaGenerateFeedback_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'API error: ${(response.statusCode ?? 200).toString()}',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).info,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
      ),
    );
  }
}

Future<CoachMessagesRecord?> openAiCoachMessage(
  BuildContext context, {
  required List<dynamic>? messages,
}) async {
  ApiCallResponse? apiOutput;
  CoachMessagesRecord? message;

  logFirebaseEvent('openAiCoachMessage_backend_call');
  apiOutput = await OpenAIGroup.foodAnalysisCall.call(
    model: 'gpt-4o',
    messagesJson: messages,
  );

  if ((apiOutput.succeeded ?? true)) {
    logFirebaseEvent('openAiCoachMessage_backend_call');

    var coachMessagesRecordReference =
        CoachMessagesRecord.createDoc(currentUserReference!);
    await coachMessagesRecordReference.set(createCoachMessagesRecordData(
      createdAt: getCurrentTimestamp,
      title: functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (apiOutput.jsonBody ?? ''),
              )
              .toString(),
          'title'),
      text: functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (apiOutput.jsonBody ?? ''),
              )
              .toString(),
          'suggestion'),
      assessment: functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (apiOutput.jsonBody ?? ''),
              )
              .toString(),
          'assessment'),
      show: true,
    ));
    message = CoachMessagesRecord.getDocumentFromData(
        createCoachMessagesRecordData(
          createdAt: getCurrentTimestamp,
          title: functions.openAiOutput(
              OpenAIGroup.foodAnalysisCall
                  .content(
                    (apiOutput.jsonBody ?? ''),
                  )
                  .toString(),
              'title'),
          text: functions.openAiOutput(
              OpenAIGroup.foodAnalysisCall
                  .content(
                    (apiOutput.jsonBody ?? ''),
                  )
                  .toString(),
              'suggestion'),
          assessment: functions.openAiOutput(
              OpenAIGroup.foodAnalysisCall
                  .content(
                    (apiOutput.jsonBody ?? ''),
                  )
                  .toString(),
              'assessment'),
          show: true,
        ),
        coachMessagesRecordReference);
    logFirebaseEvent('openAiCoachMessage_hide_snack_bar');
    ScaffoldMessenger.of(context).clearSnackBars();
    return message;
  } else {
    logFirebaseEvent('openAiCoachMessage_hide_snack_bar');
    ScaffoldMessenger.of(context).clearSnackBars();
    logFirebaseEvent('openAiCoachMessage_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'API error: ${(apiOutput.statusCode ?? 200).toString()}',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
              ),
        ),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
      ),
    );
    return null;
  }
}
