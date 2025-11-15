import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextStyle? hintTextStyle;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  bool readOnly;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isBorder;
  final Color borderColor;
  final Color textColor;
  final Color hintColor;
  final Color fillColor;
  final bool autoFocus;
  final double? width;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final bool? enable;
  final Function(PointerDownEvent)? onTapOutside;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.labelText = '',
    this.readOnly = false,
    this.autoFocus = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = const Color(0xff4DBBAE),
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.fillColor = const Color(0xffFFFFFF),
    this.width,
    this.height,
    this.hintTextStyle,
    this.isBorder = false,
    this.contentPadding,
    this.borderRadius,
    this.onSubmitted,
    this.focusNode,
    this.onChanged,
    this.enable,
    this.onTapOutside,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding:
      //     EdgeInsets.only(left: 27.w, right: 17.w, top: 13.h, bottom: 13.h),
      height: height ?? 52.h,
      width: width ?? 370.w,
      decoration: BoxDecoration(
        border: isBorder == true
            ? Border.all(color: const Color(0xFFB1B1B1), width: 1)
            : null,
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        color: AppColors.fullWhiteColor,
      ),
      child: TextFormField(
        autofocus: autoFocus,
        enabled: enable ?? true,
        readOnly: readOnly,
        cursorColor: AppColors.blueBlackColor,
        controller: controller,
        obscureText: obscureText,
        textAlign: TextAlign.start,
        style: AppTextStyles.pop400darkbluegrey14,
        focusNode: focusNode,
        onChanged: onChanged,
        onTapOutside: onTapOutside,
        onFieldSubmitted: onSubmitted ??
            (value) {
              FocusScope.of(context).nextFocus();
            },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.darkBlueGreyColor.withOpacity(0.4))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.darkBlueGreyColor.withOpacity(0.4))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.darkBlueGreyColor.withOpacity(0.4))),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintTextStyle ??
              AppTextStyles.pop400darkbluegrey14.copyWith(
                  color: AppColors.darkBlueGreyColor.withOpacity(0.5)),
          contentPadding: contentPadding,
        ),
      ),
    );
  }
}
