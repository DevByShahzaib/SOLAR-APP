
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';

class ExtraLoginResources extends StatelessWidget {
  final void Function()? onTap;
  final String iconPath;
  const ExtraLoginResources({
    super.key,
    this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.fullWhiteColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                width: 2, color: AppColors.darkBlueGreyColor.withOpacity(0.3))),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
