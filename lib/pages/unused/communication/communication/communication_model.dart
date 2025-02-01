import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'communication_widget.dart' show CommunicationWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunicationModel extends FlutterFlowModel<CommunicationWidget> {
  ///  Local state fields for this page.

  NotificationType? type;

  NotificationTime? time;

  NotificationFraming? framing;

  String? title;

  String? text;

  NotificationResponse? response;

  double? framingLossAversion;

  double? framingSocialProofing;

  double? framingHyperbolicDiscounting;

  double? framingAnchoring;

  String? timeDay;

  int? timeTimeHour;

  int? timeTimeMin;

  int progress = 0;

  List<NotificationType> currentTypes = [];
  void addToCurrentTypes(NotificationType item) => currentTypes.add(item);
  void removeFromCurrentTypes(NotificationType item) =>
      currentTypes.remove(item);
  void removeAtIndexFromCurrentTypes(int index) => currentTypes.removeAt(index);
  void insertAtIndexInCurrentTypes(int index, NotificationType item) =>
      currentTypes.insert(index, item);
  void updateCurrentTypesAtIndex(
          int index, Function(NotificationType) updateFn) =>
      currentTypes[index] = updateFn(currentTypes[index]);

  List<NotificationTime> currentTimes = [];
  void addToCurrentTimes(NotificationTime item) => currentTimes.add(item);
  void removeFromCurrentTimes(NotificationTime item) =>
      currentTimes.remove(item);
  void removeAtIndexFromCurrentTimes(int index) => currentTimes.removeAt(index);
  void insertAtIndexInCurrentTimes(int index, NotificationTime item) =>
      currentTimes.insert(index, item);
  void updateCurrentTimesAtIndex(
          int index, Function(NotificationTime) updateFn) =>
      currentTimes[index] = updateFn(currentTimes[index]);

  String? changesLossAversion;

  String? changesSociaProofing;

  String? changesHyperbolicDiscounting;

  String? changesAnchoring;

  NotificationType? typesAdded;

  NotificationType? typesRemoved;

  NotificationTime? timesAdded;

  NotificationTime? timesRemoved;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // State field(s) for Checkbox widget.
  bool? checkboxValue6;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Checkbox widget.
  bool? checkboxValue7;
  // State field(s) for Checkbox widget.
  bool? checkboxValue8;
  // State field(s) for Checkbox widget.
  bool? checkboxValue9;
  // State field(s) for Checkbox widget.
  bool? checkboxValue10;
  // State field(s) for Checkbox widget.
  bool? checkboxValue11;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
  }

  /// Action blocks.
  Future updateFirebase(
    BuildContext context, {
    NotificationResponse? response,
  }) async {
    List<NotificationsRecord>? notifications;
    ApiCallResponse? analysis;

    logFirebaseEvent('updateFirebase_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Updating communication profile...',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).info,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
        duration: const Duration(milliseconds: 999999),
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
      ),
    );
    logFirebaseEvent('updateFirebase_backend_call');

    await NotificationsRecord.createDoc(currentUserReference!)
        .set(createNotificationsRecordData(
      createdAt: getCurrentTimestamp,
      type: type,
      time: time,
      framing: framing,
      title: title,
      text: text,
      response: response,
    ));
    logFirebaseEvent('updateFirebase_firestore_query');
    notifications = await queryNotificationsRecordOnce(
      parent: currentUserReference,
    );
    logFirebaseEvent('updateFirebase_backend_call');
    analysis = await OpenAIGroup.foodAnalysisCall.call(
      model: 'gpt-4o-mini',
      messagesJson: functions.openAiNotificationUpdate(
          type,
          time,
          framing,
          valueOrDefault(currentUserDocument?.notificationsSummary, ''),
          notifications.toList(),
          valueOrDefault(currentUserDocument?.communicationTypeAnchoring, 0.0),
          valueOrDefault(
              currentUserDocument?.communicationTypeSocialProofing, 0.0),
          valueOrDefault(
              currentUserDocument?.communicationTypeHyperbolicDiscounting, 0.0),
          response,
          valueOrDefault(
              currentUserDocument?.communicationTypeLossAversion, 0.0),
          (currentUserDocument?.communicationCurrentTypes.toList() ?? [])
              .toList(),
          (currentUserDocument?.communicationCurrentTimes.toList() ?? [])
              .toList()),
    );

    if ((analysis.succeeded ?? true)) {
      logFirebaseEvent('updateFirebase_update_page_state');
      framingSocialProofing = double.parse((functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (analysis.jsonBody ?? ''),
              )
              .toString(),
          'framingSocialProofing')!));
      framingHyperbolicDiscounting = double.parse((functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (analysis.jsonBody ?? ''),
              )
              .toString(),
          'framingHyperbolicDiscounting')!));
      framingAnchoring = double.parse((functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (analysis.jsonBody ?? ''),
              )
              .toString(),
          'framingAnchoring')!));
      framingLossAversion = double.parse((functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (analysis.jsonBody ?? ''),
              )
              .toString(),
          'framingLossAversion')!));
      changesLossAversion = '${formatNumber(
        valueOrDefault(currentUserDocument?.communicationTypeLossAversion, 0.0),
        formatType: FormatType.percent,
      )} -> ${formatNumber(
        framingLossAversion,
        formatType: FormatType.percent,
      )}';
      changesSociaProofing = '${formatNumber(
        valueOrDefault(
            currentUserDocument?.communicationTypeSocialProofing, 0.0),
        formatType: FormatType.percent,
      )} -> ${formatNumber(
        framingSocialProofing,
        formatType: FormatType.percent,
      )}';
      changesHyperbolicDiscounting = '${formatNumber(
        valueOrDefault(
            currentUserDocument?.communicationTypeHyperbolicDiscounting, 0.0),
        formatType: FormatType.percent,
      )} -> ${formatNumber(
        framingHyperbolicDiscounting,
        formatType: FormatType.percent,
      )}';
      changesAnchoring = '${formatNumber(
        valueOrDefault(currentUserDocument?.communicationTypeAnchoring, 0.0),
        formatType: FormatType.percent,
      )} -> ${formatNumber(
        framingAnchoring,
        formatType: FormatType.percent,
      )}';
      if (functions.openAiOutput(
              OpenAIGroup.foodAnalysisCall
                  .content(
                    (analysis.jsonBody ?? ''),
                  )
                  .toString(),
              'removeType') !=
          'none') {
        logFirebaseEvent('updateFirebase_update_page_state');
        removeFromCurrentTypes(() {
          if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'goal_new') {
            return NotificationType.goal_new;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'goal_achieved') {
            return NotificationType.goal_achieved;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'activity_reminder') {
            return NotificationType.activity_reminder;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'reward_available') {
            return NotificationType.reward_available;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'vitality_notification') {
            return NotificationType.vitality_notification;
          } else {
            return NotificationType.plan_notification;
          }
        }());
        typesRemoved = () {
          if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'goal_new') {
            return NotificationType.goal_new;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'goal_achieved') {
            return NotificationType.goal_achieved;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'activity_reminder') {
            return NotificationType.activity_reminder;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'reward_available') {
            return NotificationType.reward_available;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeType') ==
              'vitality_notification') {
            return NotificationType.vitality_notification;
          } else {
            return NotificationType.plan_notification;
          }
        }();
      }
      if (functions.openAiOutput(
              OpenAIGroup.foodAnalysisCall
                  .content(
                    (analysis.jsonBody ?? ''),
                  )
                  .toString(),
              'addType') !=
          'none') {
        logFirebaseEvent('updateFirebase_update_page_state');
        addToCurrentTypes(() {
          if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'goal_new') {
            return NotificationType.goal_new;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'goal_achieved') {
            return NotificationType.goal_achieved;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'activity_reminder') {
            return NotificationType.activity_reminder;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'reward_available') {
            return NotificationType.reward_available;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'vitality_notification') {
            return NotificationType.vitality_notification;
          } else {
            return NotificationType.plan_notification;
          }
        }());
        typesAdded = () {
          if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'goal_new') {
            return NotificationType.goal_new;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'goal_achieved') {
            return NotificationType.goal_achieved;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'activity_reminder') {
            return NotificationType.activity_reminder;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'reward_available') {
            return NotificationType.reward_available;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addType') ==
              'vitality_notification') {
            return NotificationType.vitality_notification;
          } else {
            return NotificationType.plan_notification;
          }
        }();
      }
      if (functions.openAiOutput(
              OpenAIGroup.foodAnalysisCall
                  .content(
                    (analysis.jsonBody ?? ''),
                  )
                  .toString(),
              'removeTime') !=
          'none') {
        logFirebaseEvent('updateFirebase_update_page_state');
        removeFromCurrentTimes(() {
          if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekday_morning') {
            return NotificationTime.weekday_morning;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekday_day') {
            return NotificationTime.weekday_day;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekday_evening') {
            return NotificationTime.weekday_evening;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekend_morning') {
            return NotificationTime.weekend_morning;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekend_day') {
            return NotificationTime.weekend_day;
          } else {
            return NotificationTime.weekend_evening;
          }
        }());
        timesRemoved = () {
          if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekday_morning') {
            return NotificationTime.weekday_morning;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekday_day') {
            return NotificationTime.weekday_day;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekday_evening') {
            return NotificationTime.weekday_evening;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekend_morning') {
            return NotificationTime.weekend_morning;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'removeTime') ==
              'weekend_day') {
            return NotificationTime.weekend_day;
          } else {
            return NotificationTime.weekend_evening;
          }
        }();
      }
      if (functions.openAiOutput(
              OpenAIGroup.foodAnalysisCall
                  .content(
                    (analysis.jsonBody ?? ''),
                  )
                  .toString(),
              'addTime') !=
          'none') {
        logFirebaseEvent('updateFirebase_update_page_state');
        addToCurrentTimes(() {
          if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekday_morning') {
            return NotificationTime.weekday_morning;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekday_day') {
            return NotificationTime.weekday_day;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekday_evening') {
            return NotificationTime.weekday_evening;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekend_morning') {
            return NotificationTime.weekend_morning;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekend_day') {
            return NotificationTime.weekend_day;
          } else {
            return NotificationTime.weekend_evening;
          }
        }());
        timesAdded = () {
          if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekday_morning') {
            return NotificationTime.weekday_morning;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekday_day') {
            return NotificationTime.weekday_day;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekday_evening') {
            return NotificationTime.weekday_evening;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekend_morning') {
            return NotificationTime.weekend_morning;
          } else if (functions.openAiOutput(
                  OpenAIGroup.foodAnalysisCall
                      .content(
                        (analysis?.jsonBody ?? ''),
                      )
                      .toString(),
                  'addTime') ==
              'weekend_day') {
            return NotificationTime.weekend_day;
          } else {
            return NotificationTime.weekend_evening;
          }
        }();
      }
      logFirebaseEvent('updateFirebase_backend_call');

      await currentUserReference!.update({
        ...createUsersRecordData(
          communicationTypeLossAversion: framingLossAversion,
          communicationTypeSocialProofing: framingSocialProofing,
          communicationTypeHyperbolicDiscounting: framingHyperbolicDiscounting,
          communicationTypeAnchoring: framingAnchoring,
        ),
        ...mapToFirestore(
          {
            'communication_current_types':
                currentTypes.map((e) => e.serialize()).toList(),
            'communication_current_times':
                currentTimes.map((e) => e.serialize()).toList(),
          },
        ),
      });
      logFirebaseEvent('updateFirebase_hide_snack_bar');
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      logFirebaseEvent('updateFirebase_update_page_state');
      progress = 2;
      response = null;
      return;
    } else {
      logFirebaseEvent('updateFirebase_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'API error: ${(analysis.exceptionMessage ?? '')}',
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
  }

  Future generateMessage(BuildContext context) async {
    ApiCallResponse? newMessage;

    logFirebaseEvent('generateMessage_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Generating message...',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).info,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
        duration: const Duration(milliseconds: 999999),
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
      ),
    );
    logFirebaseEvent('generateMessage_update_page_state');
    progress = 0;
    framingLossAversion =
        valueOrDefault(currentUserDocument?.communicationTypeLossAversion, 0.0);
    framingSocialProofing = valueOrDefault(
        currentUserDocument?.communicationTypeSocialProofing, 0.0);
    framingHyperbolicDiscounting = valueOrDefault(
        currentUserDocument?.communicationTypeHyperbolicDiscounting, 0.0);
    framingAnchoring =
        valueOrDefault(currentUserDocument?.communicationTypeAnchoring, 0.0);
    currentTypes =
        (currentUserDocument?.communicationCurrentTypes.toList() ?? [])
            .toList()
            .cast<NotificationType>();
    currentTimes =
        (currentUserDocument?.communicationCurrentTimes.toList() ?? [])
            .toList()
            .cast<NotificationTime>();
    type = functions.randomNotificationType(
        (currentUserDocument?.communicationCurrentTypes.toList() ?? [])
            .toList());
    time = functions.randomNotificationTime(
        (currentUserDocument?.communicationCurrentTimes.toList() ?? [])
            .toList());
    framing = functions.randomNotificationFraming(
        valueOrDefault(currentUserDocument?.communicationTypeLossAversion, 0.0),
        valueOrDefault(
            currentUserDocument?.communicationTypeSocialProofing, 0.0),
        valueOrDefault(
            currentUserDocument?.communicationTypeHyperbolicDiscounting, 0.0),
        valueOrDefault(currentUserDocument?.communicationTypeAnchoring, 0.0));
    logFirebaseEvent('generateMessage_update_page_state');
    timeDay = functions.randomNotificationDay(time)?.name;
    timeTimeHour = functions.randomNotificationHour(time);
    timeTimeMin = random_data.randomInteger(0, 59);
    logFirebaseEvent('generateMessage_backend_call');
    newMessage = await OpenAIGroup.foodAnalysisCall.call(
      model: 'gpt-4o-mini',
      messagesJson: functions.openAiNotificationNewMessage(type, time, framing,
          valueOrDefault(currentUserDocument?.notificationsSummary, '')),
    );

    if ((newMessage.succeeded ?? true)) {
      logFirebaseEvent('generateMessage_update_page_state');
      progress = 1;
      title = functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (newMessage.jsonBody ?? ''),
              )
              .toString(),
          'title');
      text = functions.openAiOutput(
          OpenAIGroup.foodAnalysisCall
              .content(
                (newMessage.jsonBody ?? ''),
              )
              .toString(),
          'text');
      logFirebaseEvent('generateMessage_hide_snack_bar');
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      return;
    } else {
      logFirebaseEvent('generateMessage_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'API error: ${(newMessage.exceptionMessage ?? '')}',
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
  }
}
