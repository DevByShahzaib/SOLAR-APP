import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class Utils {
  static customSnackBar({required String title, required Color color}) {
    return SnackBar(
      showCloseIcon: true,
      content: Text(title,
          style: AppTextStyles.pop600blueblack20
              .copyWith(
                  color: AppColors.blueBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)
              .copyWith(color: AppColors.fullWhiteColor)),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 3),
      // animation: CustomSnackBarAnimation().createAnimationController(),
    );
  }
}
