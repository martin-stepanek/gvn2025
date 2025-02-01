import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/unused/assessments/healthy_futures/assessment_progress_bar_component/assessment_progress_bar_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assessment_progress_bar_model.dart';
export 'assessment_progress_bar_model.dart';

class AssessmentProgressBarWidget extends StatefulWidget {
  const AssessmentProgressBarWidget({
    super.key,
    required this.currentIndex,
    required this.text1,
    required this.text2,
  });

  final int? currentIndex;
  final String? text1;
  final String? text2;

  @override
  State<AssessmentProgressBarWidget> createState() =>
      _AssessmentProgressBarWidgetState();
}

class _AssessmentProgressBarWidgetState
    extends State<AssessmentProgressBarWidget> {
  late AssessmentProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssessmentProgressBarModel());

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
            Expanded(
              child: wrapWithModel(
                model: _model.assessmentProgressBarComponentModel3,
                updateCallback: () => safeSetState(() {}),
                child: AssessmentProgressBarComponentWidget(
                  index: 3,
                  currentIndex: widget.currentIndex!,
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.assessmentProgressBarComponentModel4,
                updateCallback: () => safeSetState(() {}),
                child: AssessmentProgressBarComponentWidget(
                  index: 4,
                  currentIndex: widget.currentIndex!,
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.assessmentProgressBarComponentModel5,
                updateCallback: () => safeSetState(() {}),
                child: AssessmentProgressBarComponentWidget(
                  index: 5,
                  currentIndex: widget.currentIndex!,
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.assessmentProgressBarComponentModel6,
                updateCallback: () => safeSetState(() {}),
                child: AssessmentProgressBarComponentWidget(
                  index: 6,
                  currentIndex: widget.currentIndex!,
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.assessmentProgressBarComponentModel7,
                updateCallback: () => safeSetState(() {}),
                child: AssessmentProgressBarComponentWidget(
                  index: 7,
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
