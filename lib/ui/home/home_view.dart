import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solar_app/ui/home/home_controller.dart';
import 'package:solar_app/utils/app_text_styles.dart';

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
        color: Colors.blue.shade100,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Charlie",
                          style: AppTextStyles.pop600blueblack20),
                      Text("Monday 18, 2023",
                          style: AppTextStyles.mon500liteGrey14),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Transform.scale(
                        scaleY: 0.7,
                        scaleX: 0.8,
                        child: GetBuilder<HomeController>(builder: (_) {
                          return Switch(
                            value: ctr.isSwitch,
                            onChanged: (value) {
                              ctr.isSwitch = value;
                              ctr.update();
                            },
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.grey.shade400,
                          );
                        }),
                      ),
                      Text("Switch to main electricity",
                          style: AppTextStyles.mon500liteGrey10),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
