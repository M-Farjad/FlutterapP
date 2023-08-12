import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';

class RegisterController extends GetxController {
  final RxBool obscureText = true.obs;
  // RxInt otp = 000000.obs;
  // RxString phoneNumber = ''.obs,
  //     password = ''.obs,
  //     fName = ''.obs,
  //     lName = ''.obs,
  //     address = ''.obs,
  //     city = ''.obs,
  //     pCode = ''.obs;

  final TextEditingController phoneNumberController = TextEditingController(),
      passwordController = TextEditingController(),
      otpController = TextEditingController(),
      fNameController = TextEditingController(),
      lNameController = TextEditingController(),
      addrsController = TextEditingController(),
      cityController = TextEditingController(),
      pCodeController = TextEditingController();

  // void handleLogin(GlobalKey<FormState> formKey) {
  //   if (formKey.currentState!.validate()) {
  //     // Validation passed, perform login logic here
  //     phoneNumber.value = int.parse(phoneNumberController.text);
  //     password.value = passwordController.text;
  //     // Example log output
  //     log('Phone Number: ${phoneNumber.value}');
  //     log('Password: ${password.value}');
  //     Get.toNamed(NamedRoutes.main);
  //   }
  // }

  void toggleObscureText() {
    obscureText.toggle();
  }

  void handleRegister(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      // phoneNumber.value = phoneNumberController.text;
      log('Phone Number: ${phoneNumberController.text}');
      Get.toNamed(NamedRoutes.verification);
    }
  }

  void handleVerification(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      // otp.value = int.parse(otpController.text);
      log('otp Number: ${otpController.text}');
      Get.toNamed(NamedRoutes.registration);
    }
  }

  void handleRegistration(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      // password.value = passwordController.text;
      // fName.value = fNameController.text;
      // lName.value = lNameController.text;
      log('password: ${passwordController.text}');
      log('First: ${fNameController.text}');
      log('Last: ${lNameController.text}');
      Get.toNamed(NamedRoutes.location);
    }
  }

  void handleLocation(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      // address.value = addrsController.text;
      // city.value = cityController.text;
      // pCode.value = pCodeController.text;
      log('Address: ${addrsController.text}');
      log('city: ${cityController.text}');
      log('Postal Code: ${pCodeController.text}');
      Get.toNamed(NamedRoutes.main);
    }
  }

  Future<void> registerUser() async {
    var headers = {'Content-Type': 'application/json'};
    log('entering try');
    try {
      log('entered try');
      log(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail);

      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail);
      Map body = {
        'phone': phoneNumberController.text,
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          await Get.find<SharedPreferences>().setString('token', token);

          phoneNumberController.clear();
          passwordController.clear();

          Get.offAllNamed(NamedRoutes.main);
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
        } else {
          throw jsonDecode(response.body)['Message'] ?? 'Unknown Error Occured';
        }
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(title: const Text("Error"), content: Text("$e"));
        },
      );
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    otpController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    addrsController.dispose();
    cityController.dispose();
    pCodeController.dispose();
    super.onClose();
  }
}
