import 'package:ecommerce/size_config.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const SafeArea(
        child: Body(),
      ),
    );
  }
}
