import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_app/ui/notifications/notifications_controller.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.isRegistered<NotificationsController>()
        ? Get.find<NotificationsController>()
        : Get.put(NotificationsController());
    return Container(
      padding: EdgeInsets.all(18.r),
      color: AppColors.fullWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Push Notifications", style: AppTextStyles.pop600blueblack20),
          SizedBox(height: 20.h),
          SizedBox(
            height: context.height * 0.7,
            child: ListView(
              children: [
                singleNotificationMethod(ctr, "Charging Issues", 0),
                singleNotificationMethod(ctr, "Inverter Issues", 1),
                singleNotificationMethod(ctr, "Weather Forecast", 2),
                singleNotificationMethod(ctr, "Energy Saving Suggestion", 3),
                singleNotificationMethod(ctr, "Charging Updates", 4),
                singleNotificationMethod(ctr, "Connection Help", 5),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container singleNotificationMethod(
      NotificationsController ctr, String title, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          // color: AppColors.appThemeColor,
          border: Border(
              bottom:
                  BorderSide(color: AppColors.liteGreyColor.withOpacity(0.4)))),
      child: ListTile(
        onTap: () {
          ctr.toggleSwitch(!ctr.listOfSwitches[index], index);
        },
        contentPadding: EdgeInsets.all(0),
        title: Text(title),
        trailing: Transform.scale(
          scaleY: 0.7,
          scaleX: 0.8,
          child: GetBuilder<NotificationsController>(builder: (_) {
            return Switch(
              value: ctr.listOfSwitches[index],
              onChanged: (value) {
                ctr.toggleSwitch(!ctr.listOfSwitches[index], index);
              },
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey.shade400,
            );
          }),
        ),
      ),
    );
  }
}
