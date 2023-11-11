import 'package:ecommerce/screens/sign_in/components/body.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); //As previously did we will do it here as well
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Sign-In",
          textAlign: TextAlign.center,
        )),
      ),
      body: const Body(),
    );
  }
}
