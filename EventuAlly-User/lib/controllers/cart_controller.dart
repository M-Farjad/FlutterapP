import 'package:get/get.dart';

class ToggleButtonController extends GetxController {
  RxBool isToggled = false.obs;

  void toggle() {
    isToggled.value = !isToggled.value;
  }
}
