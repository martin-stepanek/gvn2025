import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/chat_bubbles/chat_bubbles_widget.dart';
import '/components/prompt_suggestion_container/prompt_suggestion_container_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:record/record.dart';
import 'chat_enhanced_model.dart';
export 'chat_enhanced_model.dart';

class ChatEnhancedWidget extends StatefulWidget {
  const ChatEnhancedWidget({
    super.key,
    required this.category,
    required this.promptSuggestions,
    required this.newChat,
    required this.chat,
  });

  final CoachCategory? category;
  final List<String>? promptSuggestions;
  final bool? newChat;
  final ChatsRecord? chat;

  @override
  State<ChatEnhancedWidget> createState() => _ChatEnhancedWidgetState();
}

class _ChatEnhancedWidgetState extends State<ChatEnhancedWidget>
    with TickerProviderStateMixin {
  late ChatEnhancedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatEnhancedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'chat_enhanced'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_ENHANCED_chat_enhanced_ON_INIT_STAT');
      logFirebaseEvent('chat_enhanced_update_page_state');
      _model.promptSuggestions =
          widget.promptSuggestions!.toList().cast<String>();
      _model.progress = widget.chat?.step;
      _model.intent = widget.chat?.intent;
      safeSetState(() {});
      if (widget.newChat!) {
        logFirebaseEvent('chat_enhanced_backend_call');

        await MessagesRecord.createDoc(widget.chat!.reference)
            .set(createMessagesRecordData(
          timestamp: getCurrentTimestamp,
          firstMessage: false,
          message:
              'This will be a partially guided experience. Please click the button below to continue.',
          user: User.coach,
          userRef: currentUserReference,
          include: true,
          secondsToGenerate: 0.0,
          costUsd: 0.0,
          tokensTotal: 0,
          tokensPrompt: 0,
          tokensResponse: 0,
        ));
        logFirebaseEvent('chat_enhanced_backend_call');

        await MessagesRecord.createDoc(widget.chat!.reference)
            .set(createMessagesRecordData(
          timestamp: getCurrentTimestamp,
          firstMessage: false,
          message: 'Continue',
          user: User.suggestion,
          userRef: currentUserReference,
          include: true,
          secondsToGenerate: 0.0,
          costUsd: 0.0,
          tokensTotal: 0,
          tokensPrompt: 0,
          tokensResponse: 0,
        ));
      } else {
        return;
      }
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
            begin: const Offset(0.0, 17.0),
            end: const Offset(0.0, 0.0),
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
            begin: const Offset(0.0, 19.0),
            end: const Offset(0.0, 0.0),
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
    return StreamBuilder<List<MessagesRecord>>(
      stream: queryMessagesRecord(
        parent: widget.chat?.reference,
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
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<MessagesRecord> chatEnhancedMessagesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                        logFirebaseEvent(
                            'CHAT_ENHANCED_PAGE_Icon_7ua0mewq_ON_TAP');
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
                      children: [
                        StreamBuilder<ChatsRecord>(
                          stream:
                              ChatsRecord.getDocument(widget.chat!.reference),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final textChatsRecord = snapshot.data!;

                            return Text(
                              textChatsRecord.title,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            );
                          },
                        ),
                        FlutterFlowTimer(
                          initialTime: _model.timerInitialTimeMs,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            minute: false,
                          ),
                          controller: _model.timerController,
                          updateStateInterval: const Duration(milliseconds: 100),
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
                                    .primaryBackground,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                      ],
                    ),
                    actions: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: StreamBuilder<ChatsRecord>(
                          stream:
                              ChatsRecord.getDocument(widget.chat!.reference),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final iconChatsRecord = snapshot.data!;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CHAT_ENHANCED_PAGE_Icon_dky46fdh_ON_TAP');
                                var shouldSetState = false;
                                logFirebaseEvent('Icon_alert_dialog');
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: const Text('Start a new chat?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: const Text('No'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: const Text('Yes'),
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
                                  await chatsRecordReference
                                      .set(createChatsRecordData(
                                    userRef: currentUserReference,
                                    timestamp: getCurrentTimestamp,
                                    title: iconChatsRecord.title,
                                    category: widget.category,
                                    step: ProcessStep.step_01_intro,
                                  ));
                                  _model.newChatRef =
                                      ChatsRecord.getDocumentFromData(
                                          createChatsRecordData(
                                            userRef: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                            title: iconChatsRecord.title,
                                            category: widget.category,
                                            step: ProcessStep.step_01_intro,
                                          ),
                                          chatsRecordReference);
                                  shouldSetState = true;
                                  logFirebaseEvent('Icon_backend_call');

                                  await MessagesRecord.createDoc(
                                          _model.newChatRef!.reference)
                                      .set(createMessagesRecordData(
                                    timestamp: getCurrentTimestamp,
                                    firstMessage: true,
                                    message: chatEnhancedMessagesRecordList
                                        .lastOrNull?.message,
                                    user: chatEnhancedMessagesRecordList
                                        .lastOrNull?.user,
                                    userRef: currentUserReference,
                                    include: true,
                                    secondsToGenerate: 0.0,
                                    costUsd: 0.0,
                                    tokensTotal: 0,
                                    tokensPrompt: 0,
                                    tokensResponse: 0,
                                  ));
                                  logFirebaseEvent('Icon_navigate_to');
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed(
                                    'chat_enhanced',
                                    queryParameters: {
                                      'category': serializeParam(
                                        _model.newChatRef?.category,
                                        ParamType.Enum,
                                      ),
                                      'promptSuggestions': serializeParam(
                                        functions.defaultSuggetions(
                                            widget.category!),
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'newChat': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                      'chat': serializeParam(
                                        _model.newChatRef,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chat': _model.newChatRef,
                                    },
                                  );

                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }

                                if (shouldSetState) safeSetState(() {});
                              },
                              child: Icon(
                                Icons.restart_alt,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22.0,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                    centerTitle: true,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: StreamBuilder<ChatsRecord>(
                  stream: ChatsRecord.getDocument(widget.chat!.reference),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }

                    final columnChatsRecord = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            constraints: const BoxConstraints(
                              maxWidth: 700.0,
                            ),
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final message =
                                    chatEnhancedMessagesRecordList.toList();

                                return ListView.builder(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    20.0,
                                  ),
                                  reverse: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: message.length,
                                  itemBuilder: (context, messageIndex) {
                                    final messageItem = message[messageIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CHAT_ENHANCED_Container_m6z9al1l_ON_TAP');
                                        if (messageItem.user ==
                                            User.suggestion) {
                                          logFirebaseEvent(
                                              'chat_bubbles_backend_call');

                                          await MessagesRecord.createDoc(
                                                  widget.chat!.reference)
                                              .set(createMessagesRecordData(
                                            timestamp: getCurrentTimestamp,
                                            firstMessage: false,
                                            message: 'Analysing your data...',
                                            user: User.coach,
                                            userRef: currentUserReference,
                                            include: true,
                                            secondsToGenerate: 0.0,
                                            costUsd: 0.0,
                                            tokensTotal: 0,
                                            tokensPrompt: 0,
                                            tokensResponse: 0,
                                          ));
                                          logFirebaseEvent(
                                              'chat_bubbles_update_page_state');
                                          _model.promptSuggestions = functions
                                              .defaultActions(CoachCategory
                                                  .fitness_enhanced)!
                                              .toList()
                                              .cast<String>();
                                          safeSetState(() {});
                                          while (_model.index <
                                              _model.promptSuggestions.length) {
                                            logFirebaseEvent(
                                                'chat_bubbles_backend_call');

                                            await MessagesRecord.createDoc(
                                                    widget.chat!.reference)
                                                .set(createMessagesRecordData(
                                              timestamp: getCurrentTimestamp,
                                              firstMessage: false,
                                              message: _model.promptSuggestions
                                                  .elementAtOrNull(
                                                      _model.index),
                                              user: User.suggestion,
                                              userRef: currentUserReference,
                                              include: true,
                                              secondsToGenerate: 0.0,
                                              costUsd: 0.0,
                                              tokensTotal: 0,
                                              tokensPrompt: 0,
                                              tokensResponse: 0,
                                            ));
                                            logFirebaseEvent(
                                                'chat_bubbles_update_page_state');
                                            _model.index = _model.index + 1;
                                            safeSetState(() {});
                                          }
                                          logFirebaseEvent(
                                              'chat_bubbles_update_page_state');
                                          _model.promptSuggestions = [];
                                          _model.progress =
                                              ProcessStep.step_02_suggestions;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'chat_bubbles_backend_call');

                                          await MessagesRecord.createDoc(
                                                  widget.chat!.reference)
                                              .set(createMessagesRecordData(
                                            timestamp: getCurrentTimestamp,
                                            firstMessage: false,
                                            message:
                                                'What would you like me to do? Please select from the following options.',
                                            user: User.coach,
                                            userRef: currentUserReference,
                                            include: true,
                                            secondsToGenerate: 0.0,
                                            costUsd: 0.0,
                                            tokensTotal: 0,
                                            tokensPrompt: 0,
                                            tokensResponse: 0,
                                          ));
                                          logFirebaseEvent(
                                              'chat_bubbles_backend_call');

                                          await widget.chat!.reference
                                              .update(createChatsRecordData(
                                            step:
                                                ProcessStep.step_02_suggestions,
                                          ));
                                          logFirebaseEvent(
                                              'chat_bubbles_update_page_state');
                                          _model.awaitingReply = true;
                                          _model.showPromptSuggestions = false;
                                          _model.promptSuggestions = [];
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'chat_bubbles_timer');
                                          _model.timerController.onResetTimer();

                                          logFirebaseEvent(
                                              'chat_bubbles_timer');
                                          _model.timerController.onStartTimer();
                                          logFirebaseEvent(
                                              'chat_bubbles_action_block');
                                          await _model.submitIntent(context);
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'chat_bubbles_timer');
                                          _model.timerController.onStopTimer();
                                          logFirebaseEvent(
                                              'chat_bubbles_clear_text_fields_pin_codes');
                                          safeSetState(() {
                                            _model.promptTextController
                                                ?.clear();
                                          });
                                          logFirebaseEvent(
                                              'chat_bubbles_update_page_state');
                                          _model.progress =
                                              ProcessStep.step_07_done;
                                          _model.awaitingReply = false;
                                        } else {
                                          return;
                                        }
                                      },
                                      child: ChatBubblesWidget(
                                        key: Key(
                                            'Keym6z_${messageIndex}_of_${message.length}'),
                                        messageText: messageItem.message,
                                        user: messageItem.user!,
                                      ),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              constraints: const BoxConstraints(
                                maxWidth: 700.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.auto_awesome,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                  Lottie.asset(
                                    'assets/jsons/Animation_-_1711708366598.json',
                                    width: 38.0,
                                    height: 38.0,
                                    fit: BoxFit.fitHeight,
                                    animate: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (!_model.awaitingReply &&
                            (_model.promptSuggestions.isNotEmpty) &&
                            (widget.newChat! ||
                                _model.showPromptSuggestions) &&
                            (_model.progress == ProcessStep.step_07_done))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 700.0,
                              ),
                              decoration: const BoxDecoration(),
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final promptSuggestion =
                                      _model.promptSuggestions.toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          List.generate(promptSuggestion.length,
                                              (promptSuggestionIndex) {
                                        final promptSuggestionItem =
                                            promptSuggestion[
                                                promptSuggestionIndex];
                                        return PromptSuggestionContainerWidget(
                                          key: Key(
                                              'Keyq98_${promptSuggestionIndex}_of_${promptSuggestion.length}'),
                                          suggestion: promptSuggestionItem,
                                          action: () async {
                                            logFirebaseEvent(
                                                'CHAT_ENHANCED_Container_q98uq38t_CALLBAC');
                                            logFirebaseEvent(
                                                'prompt_suggestion_container_update_page_');
                                            _model.promptText =
                                                promptSuggestionItem;
                                            _model.messages =
                                                chatEnhancedMessagesRecordList
                                                    .toList()
                                                    .cast<MessagesRecord>();
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
                                            await _model.submitPrompt(context);
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
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'prompt_suggestion_container_clear_text_f');
                                            safeSetState(() {
                                              _model.promptTextController
                                                  ?.clear();
                                            });
                                          },
                                        );
                                      }).divide(const SizedBox(width: 10.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        if (_model.progress == ProcessStep.step_07_done)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        width: double.infinity,
                                        height: 40.0,
                                        decoration: const BoxDecoration(),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                                _model.promptTextController,
                                            focusNode: _model.promptFocusNode,
                                            onFieldSubmitted: (_) async {
                                              logFirebaseEvent(
                                                  'CHAT_ENHANCED_Prompt_ON_TEXTFIELD_SUBMIT');
                                              logFirebaseEvent(
                                                  'Prompt_update_page_state');
                                              _model.promptText = _model
                                                  .promptTextController.text;
                                              _model.messages =
                                                  chatEnhancedMessagesRecordList
                                                      .toList()
                                                      .cast<MessagesRecord>();
                                              safeSetState(() {});
                                              logFirebaseEvent('Prompt_timer');
                                              _model.timerController
                                                  .onResetTimer();

                                              logFirebaseEvent('Prompt_timer');
                                              _model.timerController
                                                  .onStartTimer();
                                              logFirebaseEvent(
                                                  'Prompt_action_block');
                                              await _model
                                                  .submitPrompt(context);
                                              logFirebaseEvent('Prompt_timer');
                                              _model.timerController
                                                  .onStopTimer();
                                              logFirebaseEvent(
                                                  'Prompt_clear_text_fields_pin_codes');
                                              safeSetState(() {
                                                _model.promptTextController
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
                                                    .forward(from: 0.0);
                                              }
                                            },
                                            autofocus: false,
                                            textInputAction:
                                                TextInputAction.send,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              hintText: 'Ask me anything',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 10.0, 5.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                            maxLines: null,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            validator: _model
                                                .promptTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CHAT_ENHANCED_PAGE_Icon_r62egql9_ON_TAP');
                                        logFirebaseEvent(
                                            'Icon_store_media_for_upload');
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          maxWidth: 500.00,
                                          maxHeight: 500.00,
                                          allowPhoto: true,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          pickerFontFamily: 'Lato',
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                            });
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            safeSetState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }
                                      },
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 24.0,
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (!_model.audioRecordingOn) {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CHAT_ENHANCED_PAGE_Icon_482g57w2_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_update_page_state');
                                              _model.audioRecordingOn = true;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Icon_start_audio_recording');
                                              await startAudioRecording(
                                                context,
                                                audioRecorder:
                                                    _model.audioRecorder ??=
                                                        AudioRecorder(),
                                              );
                                            },
                                            child: Icon(
                                              Icons.mic_none,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                          );
                                        } else {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CHAT_ENHANCED_PAGE_Icon_q7zkunur_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_stop_audio_recording');
                                              await stopAudioRecording(
                                                audioRecorder:
                                                    _model.audioRecorder,
                                                audioName: 'recordedFileBytes',
                                                onRecordingComplete:
                                                    (audioFilePath,
                                                        audioBytes) {
                                                  _model.audioFile =
                                                      audioFilePath;
                                                  _model.recordedFileBytes =
                                                      audioBytes;
                                                },
                                              );

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.stop_circle_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ].divide(const SizedBox(width: 15.0)),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
