import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import '../notifications/notifications_view.dart';
import '../settings/setting_view.dart';
import '../statistics/stats_view.dart';
import 'navigation_view.dart';

class NavigationController extends GetxController {
  final List<Widget> screens = const [
    HomeView(),
    StatsView(),
    NotificationsView(),
    SettingsView(),
  ];

  int selectedScreen = 0;

  void changeNavigation(int index) {
    selectedScreen = index;
    update();
  }
}
