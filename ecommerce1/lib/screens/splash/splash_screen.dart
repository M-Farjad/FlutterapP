import 'package:ecommerce/screens/splash/components/body.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); //You have to call it on your starting screen
    return const Scaffold(
      body: Body(),
    );
  }
}
