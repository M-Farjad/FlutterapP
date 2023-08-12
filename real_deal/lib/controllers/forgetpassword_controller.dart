import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/values.dart';

class ForgetPasswordController extends GetxController {
  final RxBool obscureText = true.obs;
  RxInt otp = 000000.obs;
  RxString password = ''.obs,
      phoneNumber = ''.obs,
      fName = ''.obs,
      lName = ''.obs,
      address = ''.obs,
      city = ''.obs,
      pCode = ''.obs;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void toggleObscureText() {
    obscureText.toggle();
  }

  void handleForgetPassword(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      phoneNumber.value = phoneNumberController.text;
      password.value = passwordController.text;
      otp.value = int.parse(otpController.text);

      log('Phone Number: ${phoneNumber.value}');
      log('Password: ${password.value}');
      log('otp Number: ${otp.value}');

      Get.offAllNamed(NamedRoutes.login);
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
