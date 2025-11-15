import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import 'navigation_view.dart';

class NavigationController extends GetxController {
  final List<Widget> screens = const [
    HomeView(),
    Favorites(),
    Profile(),
    SettingView(),
  ];

  int selectedScreen = 0;

  void changeNavigation(int index) {
    selectedScreen = index;
    update();
  }
}
