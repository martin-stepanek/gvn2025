import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
