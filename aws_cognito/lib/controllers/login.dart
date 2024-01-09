import 'package:aws_cognito/services/aws_cognito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      // try {
      //   await Amplify.Auth.signIn(
      //     username: emailController.text,
      //     password: passwordController.text,
      //   );
      //   Get.offNamed('/home');
      // } on AuthException catch (e) {
      //   Get.snackbar(
      //     'Error',
      //     e.message,
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      // }
      final email = emailController.text;
      final password = passwordController.text;
      AWSServices.createInitialRecord(email, password);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
