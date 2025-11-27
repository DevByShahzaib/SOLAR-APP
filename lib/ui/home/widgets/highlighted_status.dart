
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../home_controller.dart';

class HighlightedStatus extends StatelessWidget {
  const HighlightedStatus({
    super.key,
    required this.ctr,
  });

  final HomeController ctr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
