import 'package:get/get.dart';

class StatsController extends GetxController {
  bool isSwitch = false;

  List<DonutData> data = [
    DonutData("Solar Energy", 60),
    DonutData("Electricity", 20),
  ];

  void updateChart(List<DonutData> newData) {
    data = newData;
    update();
  }

  /// code for solar daily,weekly,monthly statistic
  /// Main tabs: 0=Day, 1=Week, 2=Month, 3=All time
  int selectedTab = 2;

  /// Solar toggle
  bool solarPowerEnabled = true;

  /// X-axis selection
  String? selectedXAxisLabel;

  /// Toggle solar
  void toggleSolar(bool value) {
    solarPowerEnabled = value;
    update();
  }

  /// Change main tab
  void changeTab(int index) {
    selectedTab = index;
    selectedXAxisLabel = null; // reset X-axis selection
    update();
  }

  /// Change X-axis selection - updated to accept null
  void changeXAxis(String? label) {
    selectedXAxisLabel = label;
    update();
  }

  /// Main chart data per tab
  List<PowerData> get chartData {
    switch (selectedTab) {
      case 0: // Day
        return [
          PowerData("Mon", 10),
          PowerData("Tue", 20),
          PowerData("Wed", 15),
          PowerData("Thu", 25),
          PowerData("Fri", 18),
          PowerData("Sat", 30),
          PowerData("Sun", 12),
        ];
      case 1: // Week
        return [
          PowerData("Week 1", 80),
          PowerData("Week 2", 140),
          PowerData("Week 3", 95),
          PowerData("Week 4", 180),
        ];
      case 2: // Month
        return [
          PowerData("Mar", 150),
          PowerData("Apr", 165),
          PowerData("May", 398),
          PowerData("Jun", 280),
        ];
      case 3: // All time
        return [
          PowerData("2021", 700),
          PowerData("2022", 800),
          PowerData("2023", 950),
          PowerData("2024", 1200),
        ];
      default:
        return [];
    }
  }

  /// Detailed data for each X-axis label - EXPANDED FOR ALL TABS INCLUDING DAY
  Map<String, List<PowerData>> detailedData = {
    // Day tab detailed data (hours) - 6 time periods for each day
    "Mon": [
      PowerData("6AM", 2), PowerData("9AM", 5), PowerData("12PM", 8),
      PowerData("3PM", 6), PowerData("6PM", 3), PowerData("9PM", 1)
    ],
    "Tue": [
      PowerData("6AM", 3), PowerData("9AM", 7), PowerData("12PM", 10),
      PowerData("3PM", 8), PowerData("6PM", 4), PowerData("9PM", 2)
    ],
    "Wed": [
      PowerData("6AM", 2), PowerData("9AM", 6), PowerData("12PM", 9),
      PowerData("3PM", 7), PowerData("6PM", 3), PowerData("9PM", 1)
    ],
    "Thu": [
      PowerData("6AM", 4), PowerData("9AM", 8), PowerData("12PM", 12),
      PowerData("3PM", 9), PowerData("6PM", 5), PowerData("9PM", 2)
    ],
    "Fri": [
      PowerData("6AM", 3), PowerData("9AM", 6), PowerData("12PM", 10),
      PowerData("3PM", 8), PowerData("6PM", 4), PowerData("9PM", 2)
    ],
    "Sat": [
      PowerData("6AM", 5), PowerData("9AM", 9), PowerData("12PM", 14),
      PowerData("3PM", 11), PowerData("6PM", 6), PowerData("9PM", 3)
    ],
    "Sun": [
      PowerData("6AM", 2), PowerData("9AM", 4), PowerData("12PM", 7),
      PowerData("3PM", 5), PowerData("6PM", 2), PowerData("9PM", 1)
    ],

    // Week tab detailed data (days) - 7 days for each week
    "Week 1": [
      PowerData("Mon", 15), PowerData("Tue", 20), PowerData("Wed", 18),
      PowerData("Thu", 22), PowerData("Fri", 17), PowerData("Sat", 25), PowerData("Sun", 12)
    ],
    "Week 2": [
      PowerData("Mon", 25), PowerData("Tue", 30), PowerData("Wed", 28),
      PowerData("Thu", 32), PowerData("Fri", 27), PowerData("Sat", 35), PowerData("Sun", 22)
    ],
    "Week 3": [
      PowerData("Mon", 18), PowerData("Tue", 22), PowerData("Wed", 20),
      PowerData("Thu", 24), PowerData("Fri", 19), PowerData("Sat", 28), PowerData("Sun", 15)
    ],
    "Week 4": [
      PowerData("Mon", 30), PowerData("Tue", 35), PowerData("Wed", 32),
      PowerData("Thu", 38), PowerData("Fri", 30), PowerData("Sat", 42), PowerData("Sun", 28)
    ],

    // Month tab detailed data (weeks) - 4 weeks for each month
    "Mar": [
      PowerData("Week 1", 35), PowerData("Week 2", 40), 
      PowerData("Week 3", 45), PowerData("Week 4", 30)
    ],
    "Apr": [
      PowerData("Week 1", 40), PowerData("Week 2", 45), 
      PowerData("Week 3", 50), PowerData("Week 4", 30)
    ],
    "May": [
      PowerData("Week 1", 90), PowerData("Week 2", 100), 
      PowerData("Week 3", 110), PowerData("Week 4", 98)
    ],
    "Jun": [
      PowerData("Week 1", 65), PowerData("Week 2", 75), 
      PowerData("Week 3", 80), PowerData("Week 4", 60)
    ],

    // Year tab detailed data (months) - 12 months for each year
    "2021": [
      PowerData("Jan", 50), PowerData("Feb", 60), PowerData("Mar", 70),
      PowerData("Apr", 65), PowerData("May", 80), PowerData("Jun", 75),
      PowerData("Jul", 85), PowerData("Aug", 90), PowerData("Sep", 80),
      PowerData("Oct", 70), PowerData("Nov", 65), PowerData("Dec", 60)
    ],
    "2022": [
      PowerData("Jan", 60), PowerData("Feb", 70), PowerData("Mar", 80),
      PowerData("Apr", 75), PowerData("May", 95), PowerData("Jun", 85),
      PowerData("Jul", 100), PowerData("Aug", 105), PowerData("Sep", 95),
      PowerData("Oct", 85), PowerData("Nov", 75), PowerData("Dec", 70)
    ],
    "2023": [
      PowerData("Jan", 70), PowerData("Feb", 80), PowerData("Mar", 90),
      PowerData("Apr", 85), PowerData("May", 110), PowerData("Jun", 95),
      PowerData("Jul", 115), PowerData("Aug", 120), PowerData("Sep", 110),
      PowerData("Oct", 95), PowerData("Nov", 85), PowerData("Dec", 80)
    ],
    "2024": [
      PowerData("Jan", 80), PowerData("Feb", 90), PowerData("Mar", 100),
      PowerData("Apr", 95), PowerData("May", 125), PowerData("Jun", 110),
      PowerData("Jul", 130), PowerData("Aug", 135), PowerData("Sep", 125),
      PowerData("Oct", 110), PowerData("Nov", 100), PowerData("Dec", 95)
    ],
  };

  /// Displayed chart data (detailed if X-axis selected)
  List<PowerData> get displayedChartData {
    if (selectedXAxisLabel != null &&
        detailedData.containsKey(selectedXAxisLabel!)) {
      return detailedData[selectedXAxisLabel!]!;
    }
    return chartData;
  }

  /// Get the title for the chart based on current selection
  String get chartTitle {
    if (selectedXAxisLabel != null) {
      return "Energy generated - $selectedXAxisLabel";
    }
    switch (selectedTab) {
      case 0: return "Energy generated - Day";
      case 1: return "Energy generated - Week";
      case 2: return "Energy generated - Month";
      case 3: return "Energy generated - All time";
      default: return "Energy generated";
    }
  }

  /// Energy stats - these should update based on selection
  double get totalEnergy {
    if (selectedXAxisLabel != null) {
      // Return detailed energy for selected period
      final detailed = detailedData[selectedXAxisLabel!];
      if (detailed != null) {
        return detailed.fold(0, (sum, data) => sum + data.value);
      }
    }
    
    // Return total for current tab
    switch (selectedTab) {
      case 0: return 30.276; // Day total
      case 1: return 95.450; // Week total  
      case 2: return 165.0;  // Month total (This month - Apr)
      case 3: return 398.0;  // All time total
      default: return 30.276;
    }
  }

  double get changeValue => 2.131;
  double get changePercent => 14;

  int get today => 150;
  int get thisMonth => 165;
  int get allTime => 398;

  /// Helper method to get detailed data total for any period
  double getDetailedDataTotal(String period) {
    final detailed = detailedData[period];
    if (detailed != null) {
      return detailed.fold(0, (sum, data) => sum + data.value);
    }
    return 0;
  }

  /// Check if current tab supports detailed view
  bool get supportsDetailedView {
    return true; // All tabs now support detailed view including Day
  }

  /// Get the label for detailed view based on current tab
  String get detailedViewLabel {
    switch (selectedTab) {
      case 0: return "day";
      case 1: return "week";
      case 2: return "month";
      case 3: return "year";
      default: return "period";
    }
  }

  /// Get what the detailed view will show
  String get detailedViewShows {
    switch (selectedTab) {
      case 0: return "6 hourly periods";
      case 1: return "7 days";
      case 2: return "4 weeks";
      case 3: return "12 months";
      default: return "detailed data";
    }
  }
}

class DonutData {
  final String category;
  final double value;

  DonutData(this.category, this.value);
}

class PowerData {
  final String month;
  final double value;

  PowerData(this.month, this.value);
}