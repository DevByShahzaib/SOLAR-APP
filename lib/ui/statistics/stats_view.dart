import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_app/ui/statistics/stats_controller.dart';

import '../../utils/app_colors.dart';
import 'widgets/electricity_saved_widget.dart';
import 'widgets/energy_screen.dart';
import 'widgets/title_with_switch.dart';

class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.isRegistered<StatsController>()
        ? Get.find<StatsController>()
        : Get.put(StatsController());
    return Container(
        padding: EdgeInsets.all(18.r),
        alignment: Alignment.center,
        color: AppColors.fullWhiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleWithSwitch(ctr: ctr),
              SizedBox(height: 15.h),
              ElectricitySavedWidget(ctr: ctr),
              SizedBox(height: 20.h),
              EnergyScreen()
            ],
          ),
        ));
  }
}
