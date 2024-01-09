import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final control = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Form(
          key: control.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: control.emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: control.passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () => control.login(),
                child: const Text('Login'),
              ),
            ],
          ),
        ));
  }
}
