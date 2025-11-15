import 'package:get/get.dart';

class SignupController extends GetxController {
  bool isCheck = false;
  isCheckToggle(bool isCheck) {
    isCheck = isCheck;
    update();
  }
}
