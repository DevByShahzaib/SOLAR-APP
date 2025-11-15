import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solar_app/widgets/button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/assets.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_textfield.dart';
import '../login/login_view.dart';
import '../otp/otp_view.dart';
import '../signUp/signup_view.dart';
import 'signup_controller.dart';
import 'widgets/extra_login_resource.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.isRegistered<SignupController>()
        ? Get.find<SignupController>()
        : Get.put(SignupController());
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
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up", style: AppTextStyles.pop600blueblack20),
                    SizedBox(height: 15.h),
                    CustomTextField(
                      // autoFocus: true,
                      controller: TextEditingController(),
                      hintText: "Azfarheen@gmail.com",
                      prefixIcon: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Icon(Icons.phone,
                            size: 18,
                            color:
                                AppColors.darkBlueGreyColor.withOpacity(0.5)),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: "Password",
                      prefixIcon: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Icon(Icons.lock,
                            size: 18.r,
                            color:
                                AppColors.darkBlueGreyColor.withOpacity(0.5)),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: "Confirm Password",
                      prefixIcon: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Icon(Icons.lock,
                            size: 18.r,
                            color:
                                AppColors.darkBlueGreyColor.withOpacity(0.5)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GetBuilder<SignupController>(builder: (_) {
                            return Checkbox(
                                activeColor: AppColors.appThemeColor,
                                value: ctr.isCheck,
                                onChanged: (value) {
                                  ctr.isCheck = value!;
                                  ctr.update();
                                });
                          }),
                          Container(
                            width: context.width * 0.7,
                            child: Text.rich(
                              TextSpan(
                                style: AppTextStyles
                                    .pop400darkbluegrey14, // default lite font
                                children: [
                                  TextSpan(text: "I accept "), // lite font
                                  TextSpan(
                                    text: "Terms & Conditions",
                                    style: AppTextStyles
                                        .pop600blueblack14, // semi-bold
                                  ),
                                  TextSpan(text: " and "), // lite font again
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: AppTextStyles
                                        .pop600blueblack14, // semi-bold
                                  ),
                                ],
                              ),
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        backgroundColor: AppColors.appThemeColor,
                        title: "Sign Up",
                        onPressed: () {
                          Get.to(() => OtpView());
                          
                        },
                        borderRadius: 50.h,
                        width: 255.w,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ExtraLoginResources(
                          onTap: () {},
                          iconPath: Assets.googleIcon,
                        ),
                        SizedBox(width: 10.h),
                        ExtraLoginResources(
                          onTap: () {},
                          iconPath: Assets.twiterIcon,
                        ),
                        SizedBox(width: 10.h),
                        ExtraLoginResources(
                          onTap: () {},
                          iconPath: Assets.facebookIcon,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h.h),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => LoginView());
                        },
                        child: RichText(
                            text: TextSpan(
                                text: "Already have an account? ",
                                style: AppTextStyles.pop400darkbluegrey14,
                                children: [
                              TextSpan(
                                  text: "Log In",
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
