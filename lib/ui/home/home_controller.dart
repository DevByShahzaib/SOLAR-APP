import 'package:get/get.dart';

import '../../utils/assets.dart';

class HomeController extends GetxController {
  bool isSwitch = false;
  var percent = 0.4.obs; // 0.0 → 1.0

  void updatePercent(double value) {
    percent.value = value;
  }

  List<Map<String, dynamic>> energySummary = [
    {
      "icons": [
        Assets.tubelightIcon,
        Assets.consumptionIcon,
        Assets.powerCapacityIcon,
        Assets.resetIcon
      ],
    },
    {
      "titles": [
        "Total energy",
        "Consumed",
        "Capacity",
        "Co2 Reduction",
      ]
    },
    {
      "power": [
        "36.2",
        "28.2",
        "42.0",
        "28.2",
      ]
    }
  ];

  List<PowerData> chartData = [
    PowerData("13:00", 80),
    PowerData("14:00", 120),
    PowerData("15:00", 60),
    PowerData("16:00", 95),
    PowerData("17:00", 140),
    PowerData("18:00", 100),
  ];

  double get totalKwh => chartData.fold(0.0, (sum, item) => sum + item.kwh);

  void updateChart(List<PowerData> newData) {
    chartData = newData;
    update(); // refresh GetBuilder
  }
}

class PowerData {
  final String time;
  final double kwh;

  PowerData(this.time, this.kwh);
}
