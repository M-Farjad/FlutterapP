import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/values.dart';

class LoginController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController addrsController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pCodeController = TextEditingController();

  final RxBool obscureText = true.obs;
  RxInt phoneNumber = 0.obs;
  RxInt otp = 000000.obs;
  RxString password = ''.obs,
      fName = ''.obs,
      lName = ''.obs,
      address = ''.obs,
      city = ''.obs,
      pCode = ''.obs;

  void toggleObscureText() {
    obscureText.toggle();
  }

  void handleLogin(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      // Validation passed, perform login logic here
      phoneNumber.value = int.parse(phoneNumberController.text);
      password.value = passwordController.text;

      // Example log output
      log('Phone Number: ${phoneNumber.value}');
      log('Password: ${password.value}');
      Get.toNamed(NamedRoutes.main);
    }
  }

  void handleLocation(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      address.value = addrsController.text;
      city.value = cityController.text;
      pCode.value = pCodeController.text;
      log('password: ${password.value}');
      log('First: ${fName.value}');
      log('Last: ${lName.value}');
      Get.toNamed(NamedRoutes.main);
    }
  }

  void handleRegistration(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      password.value = passwordController.text;
      fName.value = fNameController.text;
      lName.value = lNameController.text;
      log('password: ${password.value}');
      log('First: ${fName.value}');
      log('Last: ${lName.value}');
      Get.toNamed(NamedRoutes.location);
    }
  }

  void handleVerification(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      otp.value = int.parse(verificationController.text);
      log('otp Number: ${otp.value}');
      Get.toNamed(NamedRoutes.registration);
    }
  }

  void handleRegister(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      // Validation passed, perform register logic here
      phoneNumber.value = int.parse(phoneNumberController.text);
      // Example log output
      log('Phone Number: ${phoneNumber.value}');
      Get.toNamed(NamedRoutes.verification);
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
