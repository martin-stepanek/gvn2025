import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'assessment_progress_bar_component_model.dart';
export 'assessment_progress_bar_component_model.dart';

class AssessmentProgressBarComponentWidget extends StatefulWidget {
  const AssessmentProgressBarComponentWidget({
    super.key,
    required this.index,
    required this.currentIndex,
  });

  final int? index;
  final int? currentIndex;

  @override
  State<AssessmentProgressBarComponentWidget> createState() =>
      _AssessmentProgressBarComponentWidgetState();
}

class _AssessmentProgressBarComponentWidgetState
    extends State<AssessmentProgressBarComponentWidget> {
  late AssessmentProgressBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssessmentProgressBarComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 1.0,
      child: Stack(
        children: [
          if (widget.currentIndex! > widget.index!)
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          if (widget.currentIndex! < widget.index!)
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lightGrey,
              ),
            ),
          if (widget.currentIndex == widget.index)
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
              ),
            ),
        ],
      ),
    );
  }
}
