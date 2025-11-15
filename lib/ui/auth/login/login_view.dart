import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solar_app/widgets/button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/assets.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_textfield.dart';
import '../../solar_integration/solar_integration_view.dart';
import '../forgot_pass/forgot_pass_view.dart';
import '../signUp/signup_view.dart';
import 'widgets/extra_resource_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                    Text("Login", style: AppTextStyles.pop600blueblack20),
                    SizedBox(height: 30),
                    CustomTextField(
                      // autoFocus: true,
                      controller: TextEditingController(),
                      hintText: "Azfarheen@gmail.com",
                      prefixIcon: Container(
                        // margin: EdgeInsets.only(bottom: 0),
                        child: Icon(Icons.phone,
                            size: 18,
                            color:
                                AppColors.darkBlueGreyColor.withOpacity(0.5)),
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: "Password",
                      prefixIcon: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Icon(Icons.lock,
                            size: 18,
                            color:
                                AppColors.darkBlueGreyColor.withOpacity(0.5)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Get.to(() => ForgotPassView());
                          },
                          child: Text(
                            "Forgot Password?",
                            style: AppTextStyles.pop400darkbluegrey14.copyWith(
                                color: AppColors.darkBlueGreyColor
                                    .withOpacity(0.5)),
                          )),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        backgroundColor: AppColors.appThemeColor,
                        title: "Log In",
                        onPressed: () {
                          Get.to(() => SolarIntegrationView());
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     Utils.customSnackBar(
                          //         title:
                          //             "Email & Password is required to login",
                          //         color: Colors.red));
                        },
                        borderRadius: 50,
                        width: 255,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ExtraLoginResources(
                          onTap: () {},
                          iconPath: Assets.googleIcon,
                        ),
                        SizedBox(width: 10),
                        ExtraLoginResources(
                          onTap: () {},
                          iconPath: Assets.twiterIcon,
                        ),
                        SizedBox(width: 10),
                        ExtraLoginResources(
                          onTap: () {},
                          iconPath: Assets.facebookIcon,
                        ),
                      ],
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
                                text: "Don’t have an account? ",
                                style: AppTextStyles.pop400darkbluegrey14,
                                children: [
                              TextSpan(
                                  text: "Sign Up",
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
