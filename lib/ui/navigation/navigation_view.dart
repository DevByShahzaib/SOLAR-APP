import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/assets.dart';
import 'navigation_controller.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller =
        Get.put(NavigationController(), permanent: true);

    return GetBuilder<NavigationController>(
      builder: (ctr) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ctr.screens[ctr.selectedScreen],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
                color: AppColors.fullWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blueBlackColor.withOpacity(0.3),
                    blurRadius: 0.9,
                    spreadRadius: 0.6,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navItem(
                  index: 0,
                  ctr: ctr,
                  icon: Assets.homeIcon,
                  label: "Home",
                ),
                _navItem(
                  index: 1,
                  ctr: ctr,
                  icon: Assets.statisticsIcon,
                  label: "Statistics",
                ),
                _navItem(
                  index: 2,
                  ctr: ctr,
                  icon: Assets.notificationIcon,
                  label: "Notification",
                ),
                _navItem(
                  index: 3,
                  ctr: ctr,
                  icon: Assets.settingsIcon,
                  label: "Settings",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _navItem({
    required int index,
    required NavigationController ctr,
    required String icon,
    required String label,
  }) {
    final bool isActive = ctr.selectedScreen == index;

    return InkWell(
      onTap: () => ctr.changeNavigation(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 24.w,
            height: 24.h,
            color: (isActive) ? AppColors.appThemeColor : null,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: isActive
                ? AppTextStyles.pop400green14
                : AppTextStyles.pop400darkGrey14,
          ),
        ],
      ),
    );
  }
}

// ---------------- SAMPLE SCREENS ----------------

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue.shade100,
      child: const Text(
        "Profile Screen",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}


