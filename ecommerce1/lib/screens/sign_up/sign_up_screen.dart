import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String routeName = '/sign_up_screen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(title: Text('Sign-Up')),
        body: const SingleChildScrollView(
          child: Body(),
        ));
  }
}
