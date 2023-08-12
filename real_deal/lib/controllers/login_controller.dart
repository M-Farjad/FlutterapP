import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';
import '../values/values.dart';

class LoginController extends GetxController {
  // final RxBool obscureText = true.obs;
  // void toggleObscureText() {
  //   obscureText.toggle();
  // }
  RxInt otp = 000000.obs;
  RxString phoneNumber = ''.obs,
      password = ''.obs,
      fName = 'ali'.obs,
      lName = 'ahmad'.obs,
      address = '100-Lahore, Punjab, Pakistan'.obs,
      city = 'Lahore'.obs,
      pCode = '54000'.obs;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      phoneNumber.value = phoneNumberController.text;
      password.value = passwordController.text;

      log('Phone Number: ${phoneNumber.value}');
      log('Password: ${password.value}');

      Get.toNamed(NamedRoutes.main);
    }
  }

  Future<void> loginUser() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
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
    super.onClose();
  }
}
