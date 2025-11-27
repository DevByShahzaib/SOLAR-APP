import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../stats_controller.dart';

class EnergyScreen extends StatelessWidget {
  const EnergyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(
      init: StatsController(),
      builder: (ctr) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.fullWhiteColor,
              boxShadow: [
                BoxShadow(
                    color: AppColors.blueBlackColor.withOpacity(0.1),
                    spreadRadius: 1.5,
                    blurRadius: 1.2,
                    offset: Offset(0.5, 0.5))
              ],
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(ctr.chartTitle, style: AppTextStyles.pop400darkbluegrey12),
                Text("${ctr.totalEnergy}KWh",
                    style: AppTextStyles.pop500darkGrey20),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.trending_up_rounded,
                        size: 18, color: Colors.green),
                    Text(
                      "+ ${ctr.changeValue}Wh  (${ctr.changePercent}%)",
                      style: AppTextStyles.pop400green12,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ---------------- MAIN TABS ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tabItem("Day", 0, ctr),
                    tabItem("Week", 1, ctr),
                    tabItem("Month", 2, ctr),
                    tabItem("All time", 3, ctr),
                  ],
                ),
                const SizedBox(height: 12),

                // ---------------- CHART ----------------
                Container(
                  height: context.height * 0.4,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      axisLabelFormatter: (details) {
                        bool isSelected =
                            ctr.selectedXAxisLabel == details.text;
                        return ChartAxisLabel(
                          details.text,
                          TextStyle(
                            color: isSelected ? Colors.green : Colors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        );
                      },
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      interval: ctr.selectedXAxisLabel != null
                          ? _getDetailedInterval(ctr)
                          : _getMainInterval(ctr),
                      labelFormat: "{value}KWh",
                    ),
                    series: [
                      ColumnSeries<PowerData, String>(
                        dataSource:
                            List<PowerData>.from(ctr.displayedChartData),
                        xValueMapper: (d, _) => d.month,
                        yValueMapper: (d, _) => d.value,
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                        selectionBehavior: SelectionBehavior(enable: true),
                        isVisibleInLegend: false,
                        onPointTap: (ChartPointDetails details) {
                          // Allow selection for all tabs when not in detailed view
                          if (ctr.selectedXAxisLabel == null) {
                            String label = ctr
                                .displayedChartData[details.pointIndex!].month;
                            ctr.changeXAxis(label);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // ---------------- SELECTION INDICATORS (Show for ALL tabs when not in detailed view) ----------------
                if (ctr.selectedXAxisLabel == null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildSelectionIndicators(ctr),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Tap on any ${ctr.detailedViewLabel} to see ${ctr.detailedViewShows} data",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                // ---------------- BACK BUTTON (Show when in detailed view) ----------------
                if (ctr.selectedXAxisLabel != null) ...[
                  ElevatedButton.icon(
                    onPressed: () {
                      ctr.changeXAxis(null);
                    },
                    icon: Icon(Icons.arrow_back, size: 16),
                    label: Text("Back to ${getTabName(ctr.selectedTab)} view"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                // ---------------- CHECKBOX ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: ctr.solarPowerEnabled,
                      onChanged: (v) => ctr.toggleSolar(v!),
                      activeColor: Colors.green,
                    ),
                    const Text("Solar power",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 18),

                // ---------------- BOTTOM CARDS ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    statCard("${ctr.today}", "Today"),
                    statCard("${ctr.thisMonth}", "This month"),
                    statCard("${ctr.allTime}", "All time"),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectionIndicators(StatsController ctr) {
    switch (ctr.selectedTab) {
      case 0: // Day tab - show days of week
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            periodIndicator("Mon", ctr.getDetailedDataTotal("Mon"), ctr),
            periodIndicator("Tue", ctr.getDetailedDataTotal("Tue"), ctr),
            periodIndicator("Wed", ctr.getDetailedDataTotal("Wed"), ctr),
            periodIndicator("Thu", ctr.getDetailedDataTotal("Thu"), ctr),
            periodIndicator("Fri", ctr.getDetailedDataTotal("Fri"), ctr),
          ],
        );
      case 1: // Week tab
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            periodIndicator("Week 1", ctr.getDetailedDataTotal("Week 1"), ctr),
            periodIndicator("Week 2", ctr.getDetailedDataTotal("Week 2"), ctr),
            periodIndicator("Week 3", ctr.getDetailedDataTotal("Week 3"), ctr),
            periodIndicator("Week 4", ctr.getDetailedDataTotal("Week 4"), ctr),
          ],
        );
      case 2: // Month tab
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            periodIndicator("Mar", ctr.getDetailedDataTotal("Mar"), ctr),
            periodIndicator("Apr", ctr.getDetailedDataTotal("Apr"), ctr),
            periodIndicator("May", ctr.getDetailedDataTotal("May"), ctr),
            periodIndicator("Jun", ctr.getDetailedDataTotal("Jun"), ctr),
          ],
        );
      case 3: // Year tab
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            periodIndicator("2021", ctr.getDetailedDataTotal("2021"), ctr),
            periodIndicator("2022", ctr.getDetailedDataTotal("2022"), ctr),
            periodIndicator("2023", ctr.getDetailedDataTotal("2023"), ctr),
            periodIndicator("2024", ctr.getDetailedDataTotal("2024"), ctr),
          ],
        );
      default:
        return SizedBox.shrink();
    }
  }

  double _getMainInterval(StatsController ctr) {
    switch (ctr.selectedTab) {
      case 0:
        return 10; // Day
      case 1:
        return 50; // Week
      case 2:
        return 50; // Month
      case 3:
        return 200; // Year
      default:
        return 50;
    }
  }

  double _getDetailedInterval(StatsController ctr) {
    switch (ctr.selectedTab) {
      case 0:
        return 2; // Day -> Hours (smaller interval for hourly data)
      case 1:
        return 10; // Week -> Days
      case 2:
        return 20; // Month -> Weeks
      case 3:
        return 50; // Year -> Months
      default:
        return 20;
    }
  }

  Widget tabItem(String text, int index, StatsController ctr) {
    bool selected = ctr.selectedTab == index;

    return GestureDetector(
      onTap: () => ctr.changeTab(index),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: selected ? Colors.black : Colors.grey,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          if (selected) Container(height: 3, width: 30, color: Colors.green),
        ],
      ),
    );
  }

  Widget periodIndicator(String period, double value, StatsController ctr) {
    bool isSelected = ctr.selectedXAxisLabel == period;
    return GestureDetector(
      onTap: () => ctr.changeXAxis(period),
      child: Column(
        children: [
          Text(
            period,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${value.toInt()}KWh",
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget statCard(String value, String label) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
          color: AppColors.fullWhiteColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.blueBlackColor.withOpacity(0.1),
                spreadRadius: 1.5,
                blurRadius: 1.2,
                offset: Offset(0.25, 0.5))
          ],
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          RichText(
              text: TextSpan(
                  text: value,
                  style: AppTextStyles.pop600blueblack16,
                  children: [
                TextSpan(
                    text: "KWh",
                    style: AppTextStyles.pop600blueblack16
                        .copyWith(fontSize: 14.sp))
              ])),
          Text(label, style: AppTextStyles.mon500liteGrey10),
        ],
      ),
    );
  }

  String getTabName(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return "Day";
      case 1:
        return "Week";
      case 2:
        return "Month";
      case 3:
        return "All time";
      default:
        return "";
    }
  }
}
