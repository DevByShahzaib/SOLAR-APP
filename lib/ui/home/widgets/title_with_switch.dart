
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_text_styles.dart';
import '../home_controller.dart';

class TitleWithSwitch extends StatelessWidget {
  const TitleWithSwitch({
    super.key,
    required this.ctr,
  });

  final HomeController ctr;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
