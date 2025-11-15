import 'dart:async';

import 'package:get/get.dart';

import '../auth/login/login_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 5), () {
      Get.to(() => LoginView());
    });
    super.onInit();
  }
}
