import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:solar_app/ui/home/home_controller.dart';
import 'package:solar_app/utils/app_text_styles.dart';

import '../../utils/app_colors.dart';
import '../../utils/assets.dart';
import 'widgets/power_view.dart';
import 'widgets/solar_power_usage_container.dart';
import 'widgets/title_with_switch.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : Get.put(HomeController());
    return Container(
        padding: EdgeInsets.all(18.r),
        alignment: Alignment.center,
        // color: Colors.blue.shade100,
        color: AppColors.fullWhiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleWithSwitch(ctr: ctr),
              SizedBox(height: 15.h),
              SolarPowerUsageContainer(ctr: ctr),
              SizedBox(height: 15.h),
              SizedBox(
                height: context.height * 0.35,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(4.r),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.3,
                    crossAxisCount: 2, // 2 boxes per row
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 4, // total 4 boxes
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                            color: AppColors.fullWhiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColors.blueBlackColor.withOpacity(0.1),
                                  spreadRadius: 1.5,
                                  blurRadius: 1.2,
                                  offset: Offset(0.25, 0.5))
                            ],
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(ctr.energySummary[0]['icons'][index],
                                width: 40.w, height: 40.h),
                            Text(ctr.energySummary[1]['titles'][index],
                                style: AppTextStyles.pop400darkGrey14
                                    .copyWith(color: AppColors.liteGreyColor)),
                            RichText(
                                text: TextSpan(
                                    text: ctr.energySummary[2]['power'][index],
                                    style: AppTextStyles.pop500darkGrey30,
                                    children: [
                                  TextSpan(
                                      text: "Kwh",
                                      style: AppTextStyles.pop400darkGrey14)
                                ]))
                          ],
                        ));
                  },
                ),
              ),
              PowerView()
            ],
          ),
        ));
  }
}
