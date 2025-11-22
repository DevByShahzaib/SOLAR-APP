
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/assets.dart';
import '../home_controller.dart';

class SolarPowerUsageContainer extends StatelessWidget {
  const SolarPowerUsageContainer({
    super.key,
    required this.ctr,
  });

  final HomeController ctr;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.r),
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
        height: 150.h,
        width: context.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Obx(() => CircularPercentIndicator(
                    radius: 18,
                    lineWidth: 3,
                    percent: ctr.percent.value, // 0 → 1
                    animation: true,
                    animationDuration: 800,
                    progressColor: AppColors.appThemeColor,
                    backgroundColor: Colors.grey.shade300,
                    center: Image.asset(Assets.powerIcon,
                        width: 25.w, height: 25.h)
                    // Text(
                    //   "${(ctr.percent.value * 100).toInt()}%",
                    //   style: TextStyle(
                    //       fontSize: 10, fontWeight: FontWeight.bold),
                    // ),
                    )),
                SizedBox(width: 8.w),
                Text(
                  "30.276KWh",
                  style: AppTextStyles.pop600blueblack20,
                )
              ],
            ),
            // SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Solar Power Usage",
                      style: AppTextStyles.mon500liteGrey14),
                  Text(
                    "${(ctr.percent.value * 100).toInt()}%",
                    style: AppTextStyles.mon600orange10,
                  )
                ],
              ),
            ),
            Obx(() => LinearPercentIndicator(
                  // width: 200.w, // set width as needed
                  lineHeight: 5.h,
                  percent: ctr.percent.value, // same 0.0 → 1.0 value
                  animation: true,
                  animationDuration: 800,
                  progressColor: AppColors.appThemeColor,
                  backgroundColor: Colors.grey.shade300,
                  barRadius: const Radius.circular(8),
                  // center: Text(
                  //   "${(ctr.percent.value * 100).toInt()}%", // show "40%" etc.
                  //   style: const TextStyle(
                  //       fontSize: 12, fontWeight: FontWeight.bold),
                  // ),
                ))
          ],
        ));
  }
}
