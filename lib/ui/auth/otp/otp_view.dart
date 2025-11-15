import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:solar_app/widgets/button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/assets.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_textfield.dart';
import '../signUp/signup_view.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fullWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.onBoardImg),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("OTP Validation",
                        style: AppTextStyles.pop600blueblack20),
                    SizedBox(height: 10),
                    Text("We have sent OTP on your number",
                        style: AppTextStyles.pop400darkbluegrey14),
                    SizedBox(height: 40.h),
                    SizedBox(
                      height: 45.h,
                      width: 376.w,
                      child: Pinput(
                        controller: TextEditingController(),
                        length: 6,
                        cursor: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: VerticalDivider(
                            thickness: 1,
                            color: AppColors.blueBlackColor,
                          ),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        defaultPinTheme: PinTheme(
                            width: 75,
                            height: 75,
                            textStyle: AppTextStyles.pop600blueblack14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.darkBlueGreyColor
                                    .withOpacity(0.3),
                                width: 1,
                              ),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color:
                              //         AppColors.appThemeColor.withOpacity(0.5),
                              //     spreadRadius: 0,
                              //     blurRadius: 60,
                              //     offset: const Offset(0, 10),
                              //   ),
                              // ],
                            )),
                        focusedPinTheme: PinTheme(
                            textStyle: AppTextStyles.pop600blueblack14,
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.appThemeColor,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.appThemeColor.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 60,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            )),
                        errorPinTheme: PinTheme(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.appThemeColor,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.appThemeColor,
                                  spreadRadius: 0,
                                  blurRadius: 60,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        backgroundColor: AppColors.appThemeColor,
                        title: "Continue",
                        onPressed: () {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     Utils.customSnackBar(
                          //         title: "Only Digits are allowed to enter",
                          //         color: Colors.red));
                        },
                        borderRadius: 50,
                        width: 255,
                      ),
                    ),
                    SizedBox(height: 25),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => SignupView());
                        },
                        child: RichText(
                            text: TextSpan(
                                text: "Didn’t receive an OTP? ",
                                style: AppTextStyles.pop400darkbluegrey14,
                                children: [
                              TextSpan(
                                  text: "Resend OTP",
                                  style: AppTextStyles.pop600blueblack14)
                            ])),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
