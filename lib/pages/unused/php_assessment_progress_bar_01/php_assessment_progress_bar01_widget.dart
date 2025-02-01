import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/assessment_progress_bar_component/assessment_progress_bar_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'php_assessment_progress_bar01_model.dart';
export 'php_assessment_progress_bar01_model.dart';

class PhpAssessmentProgressBar01Widget extends StatefulWidget {
  const PhpAssessmentProgressBar01Widget({
    super.key,
    required this.currentIndex,
    required this.text1,
    required this.text2,
  });

  final int? currentIndex;
  final String? text1;
  final String? text2;

  @override
  State<PhpAssessmentProgressBar01Widget> createState() =>
      _PhpAssessmentProgressBar01WidgetState();
}

class _PhpAssessmentProgressBar01WidgetState
    extends State<PhpAssessmentProgressBar01Widget> {
  late PhpAssessmentProgressBar01Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhpAssessmentProgressBar01Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.text1 != null && widget.text1 != '')
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.text1,
                  'NULL',
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
              ),
            ],
          ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: wrapWithModel(
                model: _model.assessmentProgressBarComponentModel1,
                updateCallback: () => safeSetState(() {}),
                child: AssessmentProgressBarComponentWidget(
                  index: 1,
                  currentIndex: widget.currentIndex!,
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.assessmentProgressBarComponentModel2,
                updateCallback: () => safeSetState(() {}),
                child: AssessmentProgressBarComponentWidget(
                  index: 2,
                  currentIndex: widget.currentIndex!,
                ),
              ),
            ),
          ].divide(const SizedBox(width: 5.0)),
        ),
        if (widget.text2 != null && widget.text2 != '')
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.text2,
                  'NULL',
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
              ),
            ],
          ),
      ].divide(const SizedBox(height: 5.0)),
    );
  }
}
