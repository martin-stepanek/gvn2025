import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'prompt_suggestion_container_model.dart';
export 'prompt_suggestion_container_model.dart';

class PromptSuggestionContainerWidget extends StatefulWidget {
  const PromptSuggestionContainerWidget({
    super.key,
    required this.suggestion,
    required this.action,
  });

  final String? suggestion;
  final Future Function()? action;

  @override
  State<PromptSuggestionContainerWidget> createState() =>
      _PromptSuggestionContainerWidgetState();
}

class _PromptSuggestionContainerWidgetState
    extends State<PromptSuggestionContainerWidget> {
  late PromptSuggestionContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromptSuggestionContainerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('PROMPT_SUGGESTION_CONTAINER_Container_bp');
        logFirebaseEvent('Container_execute_callback');
        await widget.action?.call();
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 150.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).secondaryText,
              const Color(0xB2757575)
            ],
            stops: const [0.0, 1.0],
            begin: const AlignmentDirectional(0.0, -1.0),
            end: const AlignmentDirectional(0, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
          child: Text(
            valueOrDefault<String>(
              widget.suggestion,
              'NULL',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
        ),
      ),
    );
  }
}
