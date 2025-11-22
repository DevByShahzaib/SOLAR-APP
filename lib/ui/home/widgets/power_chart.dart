import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../home_controller.dart';

class PowerChart extends StatelessWidget {
  const PowerChart({super.key, required this.data});

  final List<PowerData> data;

  @override
  Widget build(BuildContext context) {
    final tooltip = TooltipBehavior(
      enable: true,
      canShowMarker: true,
      header: "",
      color: Colors.black87,
      textStyle: const TextStyle(color: Colors.white),
    );

    return SfCartesianChart(
      tooltipBehavior: tooltip,
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: const TextStyle(fontSize: 12),
      ),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 200,
        interval: 50,
        majorGridLines: MajorGridLines(
          width: 1,
          dashArray: [5, 5],
          color: Colors.grey.shade300,
        ),
        axisLine: const AxisLine(width: 0),
      ),
      series: [
        SplineAreaSeries<PowerData, String>(
          dataSource: data,
          xValueMapper: (PowerData d, _) => d.time,
          yValueMapper: (PowerData d, _) => d.kwh,
          name: "Power",
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(0.5),
              Colors.green.withOpacity(0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderColor: Colors.green,
          borderWidth: 1,
          markerSettings: const MarkerSettings(
            
            isVisible: true,
            shape: DataMarkerType.circle,
            width: 3,
            height: 3,
            borderColor: Colors.black,
          ),
        )
      ],
    );
  }
}
