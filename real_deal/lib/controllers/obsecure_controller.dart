import 'package:get/get.dart';

class ObsecureController extends GetxController {
  final RxBool obscureText = true.obs;
  void toggleObscureText() {
    obscureText.toggle();
  }
}
