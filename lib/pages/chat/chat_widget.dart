import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/chat_bubbles/chat_bubbles_widget.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/prompt_suggestion_container/prompt_suggestion_container_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chat'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_PAGE_chat_ON_INIT_STATE');
      logFirebaseEvent('chat_backend_call');
      _model.lastChat =
          await ChatsRecord.getDocumentOnce(currentUserDocument!.lastChat!);
      logFirebaseEvent('chat_update_page_state');
      _model.promptSuggestions =
          _model.lastChat!.suggestions.toList().cast<String>();
      safeSetState(() {});
    });

    _model.promptTextController ??= TextEditingController();
    _model.promptFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 410.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 410.0.ms,
            begin: Offset(0.0, 17.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'chatBubblesOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 530.0.ms,
            begin: Offset(0.0, 19.0),
            end: Offset(0.0, 0.0),
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
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<MessagesRecord>>(
        stream: queryMessagesRecord(
          parent: currentUserDocument?.lastChat,
          queryBuilder: (messagesRecord) => messagesRecord
              .where(
                'userRef',
                isEqualTo: currentUserReference,
              )
              .orderBy('timestamp', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }
          List<MessagesRecord> chatMessagesRecordList = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              drawer: Drawer(
                elevation: 16,
                child: wrapWithModel(
                  model: _model.drawerModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: DrawerWidget(),
                ),
              ),
              appBar: responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              )
                  ? AppBar(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      iconTheme: IconThemeData(
                          color: FlutterFlowTheme.of(context).secondaryText),
                      automaticallyImplyLeading: false,
                      leading: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('CHAT_PAGE_Icon_di0fqica_ON_TAP');
                          logFirebaseEvent('Icon_drawer');
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 22,
                        ),
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              _model.lastChat?.title,
                              'NULL',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          if (false)
                            FlutterFlowTimer(
                              initialTime: _model.timerInitialTimeMs,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                minute: false,
                              ),
                              controller: _model.timerController,
                              updateStateInterval: Duration(milliseconds: 100),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerMilliseconds = value;
                                _model.timerValue = displayTime;
                                if (shouldUpdate) safeSetState(() {});
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                        ],
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'CHAT_PAGE_Icon_1pacoryb_ON_TAP');
                              var _shouldSetState = false;
                              logFirebaseEvent('Icon_alert_dialog');
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text('Start a new chat?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Yes'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                logFirebaseEvent('Icon_backend_call');

                                var chatsRecordReference =
                                    ChatsRecord.collection.doc();
                                await chatsRecordReference.set({
                                  ...createChatsRecordData(
                                    userRef: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                    title: 'My first chat',
                                    newChat: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'suggestions':
                                          FFAppConstants.defaultSuggestions,
                                    },
                                  ),
                                });
                                _model.renewChatRef =
                                    ChatsRecord.getDocumentFromData({
                                  ...createChatsRecordData(
                                    userRef: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                    title: 'My first chat',
                                    newChat: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'suggestions':
                                          FFAppConstants.defaultSuggestions,
                                    },
                                  ),
                                }, chatsRecordReference);
                                _shouldSetState = true;
                                logFirebaseEvent('Icon_backend_call');

                                await MessagesRecord.createDoc(
                                        _model.renewChatRef!.reference)
                                    .set(createMessagesRecordData(
                                  timestamp: getCurrentTimestamp,
                                  firstMessage: true,
                                  message:
                                      'Hi there, welcome to Vitality GVC 2025! How can I help you?',
                                  user: User.coach,
                                  userRef: currentUserReference,
                                  include: true,
                                  secondsToGenerate: 0.0,
                                  costUsd: 0.0,
                                  tokensTotal: 0,
                                  tokensPrompt: 0,
                                  tokensResponse: 0,
                                ));
                                logFirebaseEvent('Icon_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  lastChat: _model.renewChatRef?.reference,
                                ));
                                logFirebaseEvent('Icon_navigate_to');

                                context.goNamed('chat');

                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            child: Icon(
                              Icons.restart_alt,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                      centerTitle: true,
                      elevation: 0,
                    )
                  : null,
              body: SafeArea(
                top: true,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      wrapWithModel(
                        model: _model.drawerModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: DrawerWidget(),
                      ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40,
                                    decoration: BoxDecoration(),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.lastChat?.title,
                                      'NULL',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 20, 0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CHAT_PAGE_Icon_hbif8401_ON_TAP');
                                        var _shouldSetState = false;
                                        logFirebaseEvent('Icon_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Start a new chat?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('No'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('Yes'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          logFirebaseEvent('Icon_backend_call');

                                          var chatsRecordReference =
                                              ChatsRecord.collection.doc();
                                          await chatsRecordReference.set({
                                            ...createChatsRecordData(
                                              userRef: currentUserReference,
                                              timestamp: getCurrentTimestamp,
                                              title: 'My first chat',
                                              newChat: true,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'suggestions': FFAppConstants
                                                    .defaultSuggestions,
                                              },
                                            ),
                                          });
                                          _model.renewChatRef =
                                              ChatsRecord.getDocumentFromData({
                                            ...createChatsRecordData(
                                              userRef: currentUserReference,
                                              timestamp: getCurrentTimestamp,
                                              title: 'My first chat',
                                              newChat: true,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'suggestions': FFAppConstants
                                                    .defaultSuggestions,
                                              },
                                            ),
                                          }, chatsRecordReference);
                                          _shouldSetState = true;
                                          logFirebaseEvent('Icon_backend_call');

                                          await MessagesRecord.createDoc(_model
                                                  .renewChatRef!.reference)
                                              .set(createMessagesRecordData(
                                            timestamp: getCurrentTimestamp,
                                            firstMessage: true,
                                            message:
                                                'Hi there, welcome to Vitality GVC 2025! How can I help you?',
                                            user: User.coach,
                                            userRef: currentUserReference,
                                            include: true,
                                            secondsToGenerate: 0.0,
                                            costUsd: 0.0,
                                            tokensTotal: 0,
                                            tokensPrompt: 0,
                                            tokensResponse: 0,
                                          ));
                                          logFirebaseEvent('Icon_backend_call');

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            lastChat:
                                                _model.renewChatRef?.reference,
                                          ));
                                          logFirebaseEvent('Icon_navigate_to');

                                          context.goNamed('chat');

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.restart_alt,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 800,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: 100,
                                        constraints: BoxConstraints(
                                          maxWidth: 700,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final message =
                                                chatMessagesRecordList.toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                20,
                                              ),
                                              reverse: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: message.length,
                                              itemBuilder:
                                                  (context, messageIndex) {
                                                final messageItem =
                                                    message[messageIndex];
                                                return ChatBubblesWidget(
                                                  key: Key(
                                                      'Key659_${messageIndex}_of_${message.length}'),
                                                  messageText:
                                                      messageItem.message,
                                                  user: messageItem.user!,
                                                  realReply: messageItem.user ==
                                                          User.coach
                                                      ? true
                                                      : false,
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'chatBubblesOnActionTriggerAnimation']!,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    if (_model.awaitingReply)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          constraints: BoxConstraints(
                                            maxWidth: 700,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 5, 0),
                                                child: Icon(
                                                  Icons.auto_awesome,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24,
                                                ),
                                              ),
                                              Lottie.asset(
                                                'assets/jsons/Animation_-_1711708366598.json',
                                                width: 38,
                                                height: 38,
                                                fit: BoxFit.fitHeight,
                                                animate: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    if (!_model.awaitingReply &&
                                        (_model.promptSuggestions.isNotEmpty) &&
                                        (_model.showPromptSuggestions ||
                                            _model.lastChat!.newChat))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 15),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 700,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final promptSuggestion = _model
                                                  .promptSuggestions
                                                  .toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      promptSuggestion.length,
                                                      (promptSuggestionIndex) {
                                                    final promptSuggestionItem =
                                                        promptSuggestion[
                                                            promptSuggestionIndex];
                                                    return PromptSuggestionContainerWidget(
                                                      key: Key(
                                                          'Keyk0t_${promptSuggestionIndex}_of_${promptSuggestion.length}'),
                                                      suggestion:
                                                          promptSuggestionItem,
                                                      action: () async {
                                                        logFirebaseEvent(
                                                            'CHAT_PAGE_Container_k0tbwh2b_CALLBACK');
                                                        logFirebaseEvent(
                                                            'prompt_suggestion_container_update_page_');
                                                        _model.promptText =
                                                            promptSuggestionItem;
                                                        _model.messages =
                                                            chatMessagesRecordList
                                                                .toList()
                                                                .cast<
                                                                    MessagesRecord>();
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'prompt_suggestion_container_timer');
                                                        _model.timerController
                                                            .onResetTimer();

                                                        logFirebaseEvent(
                                                            'prompt_suggestion_container_timer');
                                                        _model.timerController
                                                            .onStartTimer();
                                                        logFirebaseEvent(
                                                            'prompt_suggestion_container_action_block');
                                                        await _model
                                                            .submitPrompt(
                                                                context);
                                                        logFirebaseEvent(
                                                            'prompt_suggestion_container_timer');
                                                        _model.timerController
                                                            .onStopTimer();
                                                        logFirebaseEvent(
                                                            'prompt_suggestion_container_widget_anima');
                                                        if (animationsMap[
                                                                'chatBubblesOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'chatBubblesOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        logFirebaseEvent(
                                                            'prompt_suggestion_container_clear_text_f');
                                                        safeSetState(() {
                                                          _model
                                                              .promptTextController
                                                              ?.clear();
                                                        });
                                                      },
                                                    );
                                                  }).divide(
                                                      SizedBox(width: 10)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .promptTextController,
                                                      focusNode: _model
                                                          .promptFocusNode,
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        logFirebaseEvent(
                                                            'CHAT_PAGE_Prompt_ON_TEXTFIELD_SUBMIT');
                                                        logFirebaseEvent(
                                                            'Prompt_update_page_state');
                                                        _model.promptText = _model
                                                            .promptTextController
                                                            .text;
                                                        _model.messages =
                                                            chatMessagesRecordList
                                                                .toList()
                                                                .cast<
                                                                    MessagesRecord>();
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Prompt_timer');
                                                        _model.timerController
                                                            .onResetTimer();

                                                        logFirebaseEvent(
                                                            'Prompt_timer');
                                                        _model.timerController
                                                            .onStartTimer();
                                                        logFirebaseEvent(
                                                            'Prompt_action_block');
                                                        await _model
                                                            .submitPrompt(
                                                                context);
                                                        logFirebaseEvent(
                                                            'Prompt_timer');
                                                        _model.timerController
                                                            .onStopTimer();
                                                        logFirebaseEvent(
                                                            'Prompt_clear_text_fields_pin_codes');
                                                        safeSetState(() {
                                                          _model
                                                              .promptTextController
                                                              ?.clear();
                                                        });
                                                        logFirebaseEvent(
                                                            'Prompt_widget_animation');
                                                        if (animationsMap[
                                                                'chatBubblesOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'chatBubblesOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                      },
                                                      autofocus: true,
                                                      textInputAction:
                                                          TextInputAction.send,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        hintText:
                                                            'Ask me anything',
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 5,
                                                                    10, 5),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      maxLines: null,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .promptTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.camera_alt_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24,
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (!_model
                                                      .audioRecordingOn) {
                                                    return Icon(
                                                      Icons.mic_none,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 24,
                                                    );
                                                  } else {
                                                    return Icon(
                                                      Icons
                                                          .stop_circle_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 24,
                                                    );
                                                  }
                                                },
                                              ),
                                            ].divide(SizedBox(width: 15)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 0.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 0.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 0.0;
                          } else {
                            return 300.0;
                          }
                        }(),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
