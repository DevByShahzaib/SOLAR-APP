import 'package:get/get.dart';

class NotificationsController extends GetxController {
  // bool isSwitch = false;
  List listOfSwitches = [true, true, false, true, false, true];

  toggleSwitch(bool isTrue,int index) {
    listOfSwitches[index] = isTrue;
    update();
  }
}
