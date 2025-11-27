
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/assets.dart';

class AccountsDetailsContainer extends StatelessWidget {
  const AccountsDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: context.width * 0.9,
        height: context.height * 0.17,
        decoration: BoxDecoration(
            color: AppColors.appThemeColor,
            borderRadius: BorderRadius.circular(15.r)),
        child: Row(children: [
          SizedBox(width: 15.w),
          Stack(children: [
            CircleAvatar(
              backgroundColor: AppColors.fullWhiteColor,
              radius: 40,
              backgroundImage: AssetImage(Assets.accountImage),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.appThemeColor, width: 2),
                    color: AppColors.fullWhiteColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Image.asset(Assets.cameraIcon),
                ))
          ]),
          SizedBox(width: 15.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mr. Charlie Vang",
                  style: AppTextStyles.pop600white16),
              Text("Gender - Male",
                  style: AppTextStyles.pop400white14),
              Text("Age - 28 year",
                  style: AppTextStyles.pop400white14),
            ],
          )
        ]));
  }
}
