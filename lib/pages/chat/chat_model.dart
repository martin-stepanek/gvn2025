import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_widget.dart' show ChatWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String? promptText = 'Hello!';

  bool audioRecordingOn = false;

  bool showTooltip = false;

  List<MessagesRecord> messages = [];
  void addToMessages(MessagesRecord item) => messages.add(item);
  void removeFromMessages(MessagesRecord item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, MessagesRecord item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(MessagesRecord) updateFn) =>
      messages[index] = updateFn(messages[index]);

  int? time;

  List<String> promptSuggestions = [];
  void addToPromptSuggestions(String item) => promptSuggestions.add(item);
  void removeFromPromptSuggestions(String item) =>
      promptSuggestions.remove(item);
  void removeAtIndexFromPromptSuggestions(int index) =>
      promptSuggestions.removeAt(index);
  void insertAtIndexInPromptSuggestions(int index, String item) =>
      promptSuggestions.insert(index, item);
  void updatePromptSuggestionsAtIndex(int index, Function(String) updateFn) =>
      promptSuggestions[index] = updateFn(promptSuggestions[index]);

  bool showPromptSuggestions = false;

  bool awaitingReply = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in chat widget.
  ChatsRecord? lastChat;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  ChatsRecord? renewChatRef;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    minute: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Model for drawer component.
  late DrawerModel drawerModel1;
  // State field(s) for Prompt widget.
  FocusNode? promptFocusNode;
  TextEditingController? promptTextController;
  String? Function(BuildContext, String?)? promptTextControllerValidator;
  // Model for drawer component.
  late DrawerModel drawerModel2;

  @override
  void initState(BuildContext context) {
    drawerModel1 = createModel(context, () => DrawerModel());
    drawerModel2 = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    drawerModel1.dispose();
    promptFocusNode?.dispose();
    promptTextController?.dispose();

    drawerModel2.dispose();
  }

  /// Action blocks.
  Future submitPrompt(BuildContext context) async {
    MessagesRecord? newMessage;
    ApiCallResponse? aZgptCheck;
    ApiCallResponse? gptResponse;
    MessagesRecord? coachResponse;
    ApiCallResponse? gptSuggestions;

    logFirebaseEvent('submitPrompt_backend_call');

    final poemFlow = FirebaseFunctions.instance.httpsCallable('generatePoem');
    final response = await poemFlow.call("My daughter");
    print(response);

    var messagesRecordReference1 =
        MessagesRecord.createDoc(currentUserDocument!.lastChat!);
    await messagesRecordReference1.set(createMessagesRecordData(
      timestamp: getCurrentTimestamp,
      firstMessage: false,
      message: promptText,
      user: User.user,
      userRef: currentUserReference,
      include: true,
      secondsToGenerate: 0.0,
      costUsd: 0.0,
      tokensTotal: 0,
      tokensPrompt: 0,
      tokensResponse: 0,
    ));
    newMessage = MessagesRecord.getDocumentFromData(
        createMessagesRecordData(
          timestamp: getCurrentTimestamp,
          firstMessage: false,
          message: promptText,
          user: User.user,
          userRef: currentUserReference,
          include: true,
          secondsToGenerate: 0.0,
          costUsd: 0.0,
          tokensTotal: 0,
          tokensPrompt: 0,
          tokensResponse: 0,
        ),
        messagesRecordReference1);
    logFirebaseEvent('submitPrompt_update_page_state');
    promptSuggestions = [];
    showPromptSuggestions = false;
    awaitingReply = true;
    logFirebaseEvent('submitPrompt_backend_call');
    aZgptCheck = await AzureGroup.aZcoachThreePointFiveCall.call(
      messagesJson: functions.generateCheckPrompt(
          promptText,
          CoachCategory.goal_coach,
          messages
                  .where((e) =>
                      e.include && !e.firstMessage && (e.user == User.coach))
                  .toList()
                  .isNotEmpty
              ? valueOrDefault<String>(
                  messages
                      .where((e) =>
                          !e.firstMessage &&
                          e.include &&
                          (e.user == User.coach))
                      .toList()
                      .firstOrNull
                      ?.message,
                  'No previous message.',
                )
              : 'No previous message.'),
    );

    if ((aZgptCheck.succeeded ?? true)) {
      if ((AzureGroup.aZcoachThreePointFiveCall
              .content(
                (aZgptCheck.jsonBody ?? ''),
              )
              .toString()
              .trim()) ==
          'valid_prompt') {
        logFirebaseEvent('submitPrompt_backend_call');

        await MessagesRecord.createDoc(currentUserDocument!.lastChat!)
            .set(createMessagesRecordData(
          timestamp: getCurrentTimestamp,
          firstMessage: false,
          message: 'Prompt check successful. Time elapsed: ${formatNumber(
            timerMilliseconds / 1000,
            formatType: FormatType.custom,
            format: '###.#',
            locale: '',
          )} seconds. Total tokens used: ${AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                (aZgptCheck.jsonBody ?? ''),
              ).toString()}. Cost: \$${formatNumber(
            AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                  (aZgptCheck.jsonBody ?? ''),
                ) /
                1000000 *
                1.5,
            formatType: FormatType.custom,
            format: '###.#####',
            locale: '',
          )}.',
          user: User.system,
          userRef: currentUserReference,
          include: false,
          secondsToGenerate: timerMilliseconds * 1000,
          costUsd: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                (aZgptCheck.jsonBody ?? ''),
              ) /
              1000000 *
              1.5,
          tokensTotal: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
            (aZgptCheck.jsonBody ?? ''),
          ),
          tokensPrompt: AzureGroup.aZcoachThreePointFiveCall.tokensPrompt(
            (aZgptCheck.jsonBody ?? ''),
          ),
          tokensResponse: AzureGroup.aZcoachThreePointFiveCall.tokensCompletion(
            (aZgptCheck.jsonBody ?? ''),
          ),
        ));
        logFirebaseEvent('submitPrompt_update_page_state');
        time = timerMilliseconds;
        logFirebaseEvent('submitPrompt_backend_call');
        gptResponse = await AzureGroup.aZcoachThreePointFiveCall.call(
          messagesJson: functions.generateMessages(
              messages.where((e) => e.include).toList().toList(),
              valueOrDefault<String>(
                promptText,
                'Hello!',
              ),
              CoachCategory.goal_coach),
        );

        if ((gptResponse.succeeded ?? true)) {
          logFirebaseEvent('submitPrompt_backend_call');

          var messagesRecordReference3 =
              MessagesRecord.createDoc(currentUserDocument!.lastChat!);
          await messagesRecordReference3.set(createMessagesRecordData(
            timestamp: getCurrentTimestamp,
            firstMessage: false,
            message: AzureGroup.aZcoachThreePointFiveCall
                .content(
                  (gptResponse.jsonBody ?? ''),
                )
                .toString()
                .trim(),
            user: User.coach,
            userRef: currentUserReference,
            include: true,
            secondsToGenerate: (timerMilliseconds - (time!)) / 1000,
            costUsd: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                  (gptResponse.jsonBody ?? ''),
                ) /
                1000000 *
                1.5,
            tokensTotal: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
              (gptResponse.jsonBody ?? ''),
            ),
            tokensPrompt: AzureGroup.aZcoachThreePointFiveCall.tokensPrompt(
              (gptResponse.jsonBody ?? ''),
            ),
            tokensResponse:
                AzureGroup.aZcoachThreePointFiveCall.tokensCompletion(
              (gptResponse.jsonBody ?? ''),
            ),
          ));
          coachResponse = MessagesRecord.getDocumentFromData(
              createMessagesRecordData(
                timestamp: getCurrentTimestamp,
                firstMessage: false,
                message: AzureGroup.aZcoachThreePointFiveCall
                    .content(
                      (gptResponse.jsonBody ?? ''),
                    )
                    .toString()
                    .trim(),
                user: User.coach,
                userRef: currentUserReference,
                include: true,
                secondsToGenerate: (timerMilliseconds - (time!)) / 1000,
                costUsd: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                      (gptResponse.jsonBody ?? ''),
                    ) /
                    1000000 *
                    1.5,
                tokensTotal: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                  (gptResponse.jsonBody ?? ''),
                ),
                tokensPrompt: AzureGroup.aZcoachThreePointFiveCall.tokensPrompt(
                  (gptResponse.jsonBody ?? ''),
                ),
                tokensResponse:
                    AzureGroup.aZcoachThreePointFiveCall.tokensCompletion(
                  (gptResponse.jsonBody ?? ''),
                ),
              ),
              messagesRecordReference3);
          logFirebaseEvent('submitPrompt_backend_call');

          await MessagesRecord.createDoc(currentUserDocument!.lastChat!)
              .set(createMessagesRecordData(
            timestamp: getCurrentTimestamp,
            firstMessage: false,
            message: 'Time elapsed: ${formatNumber(
              (timerMilliseconds - time!.toDouble()) / 1000,
              formatType: FormatType.custom,
              format: '###.#',
              locale: '',
            )} seconds. Total tokens used: ${AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                  (gptResponse.jsonBody ?? ''),
                ).toString()}. Cost: \$${formatNumber(
              AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                    (gptResponse.jsonBody ?? ''),
                  ) /
                  1000000 *
                  1.5,
              formatType: FormatType.custom,
              format: '###.#####',
              locale: '',
            )}.',
            user: User.system,
            userRef: currentUserReference,
            include: false,
            secondsToGenerate: (timerMilliseconds - time!.toDouble()) / 1000,
            costUsd: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                  (gptResponse.jsonBody ?? ''),
                ) /
                1000000 *
                1.5,
            tokensTotal: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
              (gptResponse.jsonBody ?? ''),
            ),
            tokensPrompt: AzureGroup.aZcoachThreePointFiveCall.tokensPrompt(
              (gptResponse.jsonBody ?? ''),
            ),
            tokensResponse:
                AzureGroup.aZcoachThreePointFiveCall.tokensCompletion(
              (gptResponse.jsonBody ?? ''),
            ),
          ));
          logFirebaseEvent('submitPrompt_backend_call');
          gptSuggestions = await AzureGroup.aZcoachThreePointFiveCall.call(
            messagesJson:
                functions.generateSuggestionsPrompt(coachResponse.message),
          );

          if ((gptSuggestions.succeeded ?? true)) {
            logFirebaseEvent('submitPrompt_update_page_state');
            promptSuggestions = functions
                .getSuggestions(AzureGroup.aZcoachThreePointFiveCall
                    .content(
                      (gptSuggestions.jsonBody ?? ''),
                    )
                    .toString())!
                .toList()
                .cast<String>();
            showPromptSuggestions = true;
            awaitingReply = false;
          } else {
            logFirebaseEvent('submitPrompt_backend_call');

            await MessagesRecord.createDoc(currentUserDocument!.lastChat!)
                .set(createMessagesRecordData(
              timestamp: getCurrentTimestamp,
              firstMessage: false,
              message:
                  'GPT suggestions API error. Status code ${(gptSuggestions.statusCode ?? 200).toString()}',
              user: User.system,
              userRef: currentUserReference,
              include: false,
            ));
            logFirebaseEvent('submitPrompt_update_page_state');
            promptSuggestions = [];
            showPromptSuggestions = false;
            awaitingReply = false;
            return;
          }
        } else {
          logFirebaseEvent('submitPrompt_backend_call');

          await MessagesRecord.createDoc(currentUserDocument!.lastChat!)
              .set(createMessagesRecordData(
            timestamp: getCurrentTimestamp,
            firstMessage: false,
            message:
                'GPT response API error. Status code ${(gptResponse.statusCode ?? 200).toString()}',
            user: User.system,
            userRef: currentUserReference,
            include: false,
          ));
          logFirebaseEvent('submitPrompt_update_page_state');
          awaitingReply = false;
          return;
        }
      } else {
        logFirebaseEvent('submitPrompt_backend_call');

        await MessagesRecord.createDoc(currentUserDocument!.lastChat!)
            .set(createMessagesRecordData(
          timestamp: getCurrentTimestamp,
          firstMessage: false,
          message:
              'I am sorry, but I cannot help you with that. Try asking something else.',
          user: User.coach,
          userRef: currentUserReference,
          include: false,
          secondsToGenerate: timerMilliseconds * 1000,
          costUsd: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                (aZgptCheck.jsonBody ?? ''),
              ) /
              1000000 *
              1.5,
          tokensTotal: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
            (aZgptCheck.jsonBody ?? ''),
          ),
          tokensPrompt: AzureGroup.aZcoachThreePointFiveCall.tokensPrompt(
            (aZgptCheck.jsonBody ?? ''),
          ),
          tokensResponse: AzureGroup.aZcoachThreePointFiveCall.tokensCompletion(
            (aZgptCheck.jsonBody ?? ''),
          ),
        ));
        logFirebaseEvent('submitPrompt_backend_call');

        await MessagesRecord.createDoc(currentUserDocument!.lastChat!)
            .set(createMessagesRecordData(
          timestamp: getCurrentTimestamp,
          firstMessage: false,
          message:
              'Time elapsed: $timerValue seconds. Tokens used: ${AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                    (aZgptCheck.jsonBody ?? ''),
                  ).toString()}. Cost: \$${formatNumber(
            AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                  (aZgptCheck.jsonBody ?? ''),
                ) /
                1000000 *
                1.5,
            formatType: FormatType.custom,
            format: '###.#####',
            locale: '',
          )}.',
          user: User.system,
          userRef: currentUserReference,
          include: false,
          secondsToGenerate: timerMilliseconds * 1000,
          costUsd: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
                (aZgptCheck.jsonBody ?? ''),
              ) /
              1000000 *
              1.5,
          tokensTotal: AzureGroup.aZcoachThreePointFiveCall.tokensTotal(
            (aZgptCheck.jsonBody ?? ''),
          ),
          tokensPrompt: AzureGroup.aZcoachThreePointFiveCall.tokensPrompt(
            (aZgptCheck.jsonBody ?? ''),
          ),
          tokensResponse: AzureGroup.aZcoachThreePointFiveCall.tokensCompletion(
            (aZgptCheck.jsonBody ?? ''),
          ),
        ));
        logFirebaseEvent('submitPrompt_backend_call');

        await newMessage.reference.update(createMessagesRecordData(
          include: false,
        ));
        logFirebaseEvent('submitPrompt_update_page_state');
        awaitingReply = false;
        return;
      }

      return;
    } else {
      logFirebaseEvent('submitPrompt_backend_call');

      await MessagesRecord.createDoc(currentUserDocument!.lastChat!)
          .set(createMessagesRecordData(
        timestamp: getCurrentTimestamp,
        firstMessage: false,
        message:
            'GPT check API error. Status code ${(aZgptCheck.statusCode ?? 200).toString()}',
        user: User.system,
        userRef: currentUserReference,
        include: false,
      ));
      logFirebaseEvent('submitPrompt_update_page_state');
      awaitingReply = false;
      return;
    }
  }
}
