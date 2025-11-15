import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:solar_app/ui/auth/login/login_view.dart';
import 'package:solar_app/widgets/button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/assets.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_textfield.dart';
import '../signUp/signup_view.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

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
                    Text("Forgot Password",
                        style: AppTextStyles.pop600blueblack20),
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
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        backgroundColor: AppColors.appThemeColor,
                        title: "Submit",
                        onPressed: () {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     Utils.customSnackBar(
                          //         title: "Email is required",
                          //         color: Colors.red));
                        },
                        borderRadius: 50,
                        width: 255,
                      ),
                    ),
                    SizedBox(height: 25),
                    InkWell(
                        onTap: () {
                          Get.to(() => LoginView());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back,
                                size: 16, color: AppColors.darkBlueGreyColor),
                            SizedBox(width: 5),
                            Text("Back to LogIn",
                                style: AppTextStyles.pop400darkbluegrey14)
                          ],
                        ))
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
