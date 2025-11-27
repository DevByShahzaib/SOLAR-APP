import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_app/ui/notifications/notifications_controller.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/assets.dart';
import '../accounts_managing/acounts_view.dart';
import 'setting_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.isRegistered<SettingController>()
        ? Get.find<SettingController>()
        : Get.put(SettingController());
    return Container(
      padding: EdgeInsets.all(18.r),
      color: AppColors.fullWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Settings", style: AppTextStyles.pop600blueblack20),
          SizedBox(height: 20.h),
          SizedBox(
            height: context.height * 0.7,
            child: ListView(
              children: [
                singleSettingMethod(ctr, "Account", Assets.personIcon,
                    onTap: () {
                  Get.to(AccountsView());
                }),
                singleSettingMethod(
                    ctr, "Solar Details", Assets.solarDetailsIcon),
                singleSettingMethod(ctr, "Contact Us", Assets.contactIcon),
                singleSettingMethod(
                    ctr, "Terms & Conditions", Assets.termsConditionIcon),
                singleSettingMethod(
                    ctr, "Privacy Policy", Assets.privacyPolicyIcon),
                singleSettingMethod(ctr, "About", Assets.aboutIcon),
                singleSettingMethod(ctr, "Logout", Assets.logoutIcon),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container singleSettingMethod(
      SettingController ctr, String title, String leadingIcon,
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
