import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'health_feedback_progress_bar_model.dart';
export 'health_feedback_progress_bar_model.dart';

class HealthFeedbackProgressBarWidget extends StatefulWidget {
  const HealthFeedbackProgressBarWidget({
    super.key,
    required this.bad,
    required this.good,
    required this.uknown,
  });

  final double? bad;
  final double? good;
  final double? uknown;

  @override
  State<HealthFeedbackProgressBarWidget> createState() =>
      _HealthFeedbackProgressBarWidgetState();
}

class _HealthFeedbackProgressBarWidgetState
    extends State<HealthFeedbackProgressBarWidget> {
  late HealthFeedbackProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthFeedbackProgressBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 0.0),
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearPercentIndicator(
                percent: widget.uknown!,
                width: MediaQuery.sizeOf(context).width * 0.85,
                lineHeight: 15.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: const Color(0xFF939695),
                backgroundColor: const Color(0x00FFFFFF),
                barRadius: const Radius.circular(32.0),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearPercentIndicator(
                percent: widget.good!,
                width: MediaQuery.sizeOf(context).width * 0.85,
                lineHeight: 15.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: const Color(0xFF11A33B),
                backgroundColor: const Color(0x00FFFFFF),
                barRadius: const Radius.circular(32.0),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearPercentIndicator(
                percent: widget.bad!,
                width: MediaQuery.sizeOf(context).width * 0.85,
                lineHeight: 15.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: const Color(0xFFF01A31),
                backgroundColor: const Color(0x00FFFFFF),
                barRadius: const Radius.circular(32.0),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
