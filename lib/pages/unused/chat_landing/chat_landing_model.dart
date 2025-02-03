import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/expandable_button/expandable_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_landing_widget.dart' show ChatLandingWidget;
import 'package:flutter/material.dart';

class ChatLandingModel extends FlutterFlowModel<ChatLandingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? newChatDocument;
  // Model for expandable_button component.
  late ExpandableButtonModel expandableButtonModel;

  @override
  void initState(BuildContext context) {
    expandableButtonModel = createModel(context, () => ExpandableButtonModel());
  }

  @override
  void dispose() {
    expandableButtonModel.dispose();
  }

  /// Action blocks.
  Future startChat(
    BuildContext context, {
    required String? name,
    required CoachCategory? category,
    required List<String>? promptSuggestions,
    required String? introMessage,
    List<ChatsRecord>? chatDocuments,
  }) async {
    ChatsRecord? newChat;

    if (chatDocuments != null && (chatDocuments).isNotEmpty) {
      logFirebaseEvent('startChat_navigate_to');

      context.pushNamed('chat');
    } else {
      logFirebaseEvent('startChat_backend_call');

      var chatsRecordReference = ChatsRecord.collection.doc();
      await chatsRecordReference.set(createChatsRecordData(
        userRef: currentUserReference,
        timestamp: getCurrentTimestamp,
        title: name,
        category: category,
      ));
      newChat = ChatsRecord.getDocumentFromData(
          createChatsRecordData(
            userRef: currentUserReference,
            timestamp: getCurrentTimestamp,
            title: name,
            category: category,
          ),
          chatsRecordReference);
      logFirebaseEvent('startChat_backend_call');

      await MessagesRecord.createDoc(newChat.reference)
          .set(createMessagesRecordData(
        timestamp: getCurrentTimestamp,
        firstMessage: true,
        message: introMessage,
        user: User.coach,
        userRef: currentUserReference,
        include: true,
        secondsToGenerate: 0.0,
        costUsd: 0.0,
        tokensTotal: 0,
        tokensPrompt: 0,
        tokensResponse: 0,
      ));
      logFirebaseEvent('startChat_navigate_to');

      context.pushNamed('chat');
    }
  }
}
