
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../stats_controller.dart';
import 'donut_chart.dart';

class ElectricitySavedWidget extends StatelessWidget {
  const ElectricitySavedWidget({
    super.key,
    required this.ctr,
  });

  final StatsController ctr;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      // padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
          color: AppColors.fullWhiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blueBlackColor.withOpacity(0.1),
              spreadRadius: 1.5,
              blurRadius: 1.2,
              offset: Offset(0.5, 0.5),
            )
          ],
          borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w),
            child: Text("Electricity Saved",
                style: AppTextStyles.pop500darkGrey20),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<StatsController>(
              builder: (_) {
                return DonutChart(data: ctr.data);
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Text(
                "75% electricity saved",
                style: AppTextStyles.pop600blueblack16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
