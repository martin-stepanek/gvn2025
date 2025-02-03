import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'chat_bubbles_model.dart';
export 'chat_bubbles_model.dart';

class ChatBubblesWidget extends StatefulWidget {
  const ChatBubblesWidget({
    super.key,
    required this.messageText,
    required this.user,
    bool? realReply,
  }) : this.realReply = realReply ?? false;

  final String? messageText;
  final User? user;
  final bool realReply;

  @override
  State<ChatBubblesWidget> createState() => _ChatBubblesWidgetState();
}

class _ChatBubblesWidgetState extends State<ChatBubblesWidget> {
  late ChatBubblesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBubblesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (widget!.user == User.coach) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 5, 0),
                    child: Icon(
                      Icons.auto_awesome,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.7,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 10, 15, 10),
                                child: SelectionArea(
                                    child: Text(
                                  valueOrDefault<String>(
                                    widget!.messageText,
                                    'NULL',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Colors.white,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                )),
                              ),
                            ),
                          ),
                          if (valueOrDefault<bool>(
                            widget!.realReply,
                            false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8,
                                    buttonSize: 31,
                                    fillColor: Color(0x00FFFFFF),
                                    hoverColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    hoverIconColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.content_copy_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 15,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CHAT_BUBBLES_content_copy_rounded_ICN_ON');
                                      logFirebaseEvent(
                                          'IconButton_copy_to_clipboard');
                                      await Clipboard.setData(ClipboardData(
                                          text: widget!.messageText!));
                                      logFirebaseEvent(
                                          'IconButton_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Copied to clipboard!',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3100),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8,
                                    buttonSize: 31,
                                    fillColor: Color(0x00FFFFFF),
                                    hoverColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    hoverIconColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.thumb_up_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 15,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CHAT_BUBBLES_thumb_up_outlined_ICN_ON_TA');
                                      logFirebaseEvent(
                                          'IconButton_copy_to_clipboard');
                                      await Clipboard.setData(ClipboardData(
                                          text: widget!.messageText!));
                                      logFirebaseEvent(
                                          'IconButton_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Copied to clipboard!',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3100),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8,
                                    buttonSize: 31,
                                    fillColor: Color(0x00FFFFFF),
                                    hoverColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    hoverIconColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.thumb_down_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      size: 15,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CHAT_BUBBLES_thumb_down_outlined_ICN_ON_');
                                      logFirebaseEvent(
                                          'IconButton_copy_to_clipboard');
                                      await Clipboard.setData(ClipboardData(
                                          text: widget!.messageText!));
                                      logFirebaseEvent(
                                          'IconButton_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Copied to clipboard!',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3100),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      onEnter: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered1 = true);
                        logFirebaseEvent(
                            'CHAT_BUBBLES_MouseRegion_w81k4mj3_ON_TOG');
                        logFirebaseEvent('MouseRegion_update_component_state');
                        _model.copyHover = true;
                        safeSetState(() {});
                      }),
                      onExit: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered1 = false);
                        logFirebaseEvent(
                            'CHAT_BUBBLES_MouseRegion_w81k4mj3_ON_TOG');
                        logFirebaseEvent('MouseRegion_update_component_state');
                        _model.copyHover = true;
                        safeSetState(() {});
                      }),
                    ),
                  ),
                ],
              ),
            );
          } else if (widget!.user == User.user) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.7,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: Color(0x0FFFFFFF),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 10, 15, 10),
                                child: SelectionArea(
                                    child: Text(
                                  valueOrDefault<String>(
                                    widget!.messageText,
                                    'NULL',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7, 4, 7, 0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/1676852949201025.jpg',
                          ).image,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (widget!.user == User.system) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(29, 5, 0, 5),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                      ),
                      decoration: BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.messageText,
                          'NULL',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (widget!.user == User.suggestion) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 10, 15, 10),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget!.messageText,
                                    'NULL',
                                  ),
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7, 4, 7, 0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          width: 1.5,
                        ),
                      ),
                      child: Icon(
                        Icons.tips_and_updates_sharp,
                        color: FlutterFlowTheme.of(context).info,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (widget!.user == User.graph) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 5, 0),
                        child: Icon(
                          Icons.auto_awesome,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * 0.7,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 10, 15, 10),
                                  child: SelectionArea(
                                      child: Text(
                                    'Here is a chart showing your recent daily steps',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: Colors.white,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    child: custom_widgets.LineChart(
                      width: double.infinity,
                      height: 180,
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 20)),
            );
          } else if (widget!.user == User.infographic) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(29, 0, 0, 0),
                    child: SelectionArea(
                        child: Text(
                      'You have a new daily step goal!',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    )),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 5, 0),
                        child: Icon(
                          Icons.notification_important,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 0.7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 10, 15, 10),
                                    child: SelectionArea(
                                        child: Text(
                                      '${valueOrDefault<String>(
                                        widget!.messageText,
                                        'NULL',
                                      )} steps',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                    )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8,
                                  buttonSize: 31,
                                  fillColor: Color(0x00FFFFFF),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  hoverIconColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.content_copy_rounded,
                                    color: FlutterFlowTheme.of(context).accent4,
                                    size: 15,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CHAT_BUBBLES_content_copy_rounded_ICN_ON');
                                    logFirebaseEvent(
                                        'IconButton_copy_to_clipboard');
                                    await Clipboard.setData(ClipboardData(
                                        text: widget!.messageText!));
                                    logFirebaseEvent(
                                        'IconButton_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Copied to clipboard!',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3100),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered2 = true);
                            logFirebaseEvent(
                                'CHAT_BUBBLES_MouseRegion_e85bxkxy_ON_TOG');
                            logFirebaseEvent(
                                'MouseRegion_update_component_state');
                            _model.copyHover = true;
                            safeSetState(() {});
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered2 = false);
                            logFirebaseEvent(
                                'CHAT_BUBBLES_MouseRegion_e85bxkxy_ON_TOG');
                            logFirebaseEvent(
                                'MouseRegion_update_component_state');
                            _model.copyHover = true;
                            safeSetState(() {});
                          }),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 5)),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            );
          }
        },
      ),
    );
  }
}
