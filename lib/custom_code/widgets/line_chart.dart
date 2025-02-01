// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';
import '/auth/firebase_auth/auth_util.dart';

class LineChart extends StatefulWidget {
  const LineChart({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: StreamBuilder<List<PaDataRecord>>(
        stream: queryPaDataRecord(
          parent: currentUserReference,
          queryBuilder: (paDataRecord) => paDataRecord
              .where(
                'data_type',
                isEqualTo: 'daily',
              )
              .orderBy('event_date'),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var chartData = snapshot.data;
            return SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                    majorGridLines:
                        MajorGridLines(width: 0) // Remove X-axis grid lines
                    ),
                primaryYAxis: NumericAxis(
                    majorGridLines:
                        MajorGridLines(width: 0) // Remove Y-axis grid lines
                    ),
                legend: Legend(isVisible: false),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries>[
                  LineSeries<PaDataRecord, DateTime>(
                      dataSource: chartData,
                      xValueMapper: (PaDataRecord data, _) => data.eventDate,
                      yValueMapper: (PaDataRecord data, _) => data.steps,
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2)
                ]);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
