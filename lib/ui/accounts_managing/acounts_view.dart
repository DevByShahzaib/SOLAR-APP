import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_app/utils/app_colors.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/assets.dart';
import '../edit_profile/edit_profile_view.dart';
import 'accounts_controller.dart';
import 'widgets/account_details_container.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.isRegistered<AccountsController>()
        ? Get.find<AccountsController>()
        : Get.put(AccountsController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(18.r),
          color: AppColors.fullWhiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(children: [
                    Icon(CupertinoIcons.back, size: 23.w),
                    SizedBox(width: 5.w),
                    Text("Account", style: AppTextStyles.pop600blueblack20)
                  ])),
              SizedBox(height: 20.h),
              AccountsDetailsContainer(),
              SizedBox(height: 20.h),
              Text("Account Details", style: AppTextStyles.pop600blueblack16),
              SizedBox(height: 20.h),
              singleSettingMethod(ctr, "Edit Profile", Assets.personIcon,
                  onTap: () {
                Get.to(EditProfileView());
              })
            ],
          ),
        ),
      ),
    );
  }

  Container singleSettingMethod(
      AccountsController ctr, String title, String leadingIcon,
      {void Function()? onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          // color: AppColors.appThemeColor,
          border: Border(
              bottom:
                  BorderSide(color: AppColors.liteGreyColor.withOpacity(0.4)))),
      child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.all(0),
          leading: Image.asset(leadingIcon, width: 20.w, height: 20.h),
          title: Text(title),
          trailing:
              Image.asset(Assets.nextPageIcon, width: 18.w, height: 18.h)),
    );
  }
}
