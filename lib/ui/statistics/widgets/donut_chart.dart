import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_app/utils/app_text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/assets.dart';
import '../stats_controller.dart';

class DonutChart extends StatelessWidget {
  final List<DonutData> data;
  const DonutChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfCircularChart(
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          series: <DoughnutSeries<DonutData, String>>[
            DoughnutSeries<DonutData, String>(
              dataSource: data,
              xValueMapper: (DonutData d, _) => d.category,
              yValueMapper: (DonutData d, _) => d.value,
              // dataLabelMapper: (DonutData d, _) => d.label,
              dataLabelSettings: const DataLabelSettings(
                // isVisible: true,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Inner radius creates donut
              innerRadius: '80%',
              legendIconType: LegendIconType.rectangle,

              pointColorMapper: (DonutData d, index) {
                switch (index) {
                  case 0:
                    return Colors.green;
                  case 1:
                    return Colors.red;
                }
                return Colors.grey;
              },
            ),
          ],
        ),
        Positioned(
            top: 120.h,
            left: 128.w,
            child: Column(
              children: [
                Image.asset(
                  Assets.currentIcon,
                  width: 30.w,
                  height: 30.h,
                ),
                Text("75%", style: AppTextStyles.pop600blueblack20),
                Text("Electricity", style: AppTextStyles.pop400litegrey18),
              ],
            ))
      ],
    );
  }
}
