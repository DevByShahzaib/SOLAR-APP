import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solar_app/utils/app_colors.dart';

import '../../utils/assets.dart';
import 'splash_screen_controller.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.isRegistered<SplashScreenController>()
        ? Get.find<SplashScreenController>()
        : Get.put(SplashScreenController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA8E6A3),
              Color(0xFF49B02D),
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset(Assets.appLogo)],
        ),
      ),
    );
  }
}
