import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:solar_app/ui/auth/login/login_view.dart';
import 'package:solar_app/ui/navigation/navigation_view.dart';
import 'package:solar_app/widgets/button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/assets.dart';
import '../../../widgets/custom_textfield.dart';
import '../../utils/utils.dart';
import '../scan_page/scan_page_view.dart';

class SolarIntegrationView extends StatelessWidget {
  const SolarIntegrationView({super.key});

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
                    Text("Solar Integration",
                        style: AppTextStyles.pop600blueblack20),
                    SizedBox(height: 30),
                    CustomTextField(
                      // autoFocus: true,
                      controller: TextEditingController(),
                      hintText: "Solar Model Number",
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        // margin: EdgeInsets.only(bottom: 0),
                        child: Image.asset(
                          Assets.solarModelIcon,
                          color: AppColors.darkBlueGreyColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      // autoFocus: true,
                      controller: TextEditingController(),
                      hintText: "Capacity(watts or Kilowatts)",
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        // margin: EdgeInsets.only(bottom: 0),
                        child: Image.asset(Assets.capacityIcon),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      // autoFocus: true,
                      controller: TextEditingController(),
                      hintText: "Meter Number",
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        // margin: EdgeInsets.only(bottom: 0),
                        child: Image.asset(Assets.energyMeterIcon),
                      ),
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        backgroundColor: AppColors.appThemeColor,
                        title: "Verify Details",
                        onPressed: () {
                          Get.offAll(NavigationView());
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     Utils.customSnackBar(
                          //         title: "All Fields are required",
                          //         color: Colors.red));
                        },
                        borderRadius: 50,
                        width: 255,
                      ),
                    ),
                    SizedBox(height: 25),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Container(
                    //     width: context.width * 0.75,
                    //     child: Text.rich(
                    //       TextSpan(
                    //         style: AppTextStyles
                    //             .pop400darkbluegrey14, // your lite font style
                    //         children: [
                    //           TextSpan(text: "Or "), // lite
                    //           TextSpan(
                    //             text: "click here",
                    //             style: AppTextStyles
                    //                 .pop600blueblack14, // bold/semi-bold
                    //           ),
                    //           TextSpan(
                    //               text:
                    //                   " to scan barcode to connect (check it on inverter)"), // lite
                    //         ],
                    //       ),
                    //       softWrap: true,
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // )
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text.rich(
                          TextSpan(
                            style:
                                AppTextStyles.pop400darkbluegrey14, // lite font
                            children: [
                              const TextSpan(text: "Or "),
                              TextSpan(
                                text: "click here",
                                style: AppTextStyles.pop600blueblack14, // bold
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    final result =
                                        await Get.to(() => const ScannerPage());

                                    if (result != null) {
                                      Get.snackbar(
                                        "Scanned",
                                        "Barcode: $result",
                                        snackPosition: SnackPosition.BOTTOM,
                                      );

                                      // 👉 Here you can call your inverter connection API
                                      // Get.find<InverterController>().connectWithBarcode(result);
                                    }
                                  },
                              ),
                              const TextSpan(
                                text:
                                    " to scan barcode to connect (check it on inverter)",
                              ),
                            ],
                          ),
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
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
