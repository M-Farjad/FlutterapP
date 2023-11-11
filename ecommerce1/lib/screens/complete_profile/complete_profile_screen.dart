import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text('Complete Profile')),
      body: Body(),
    );
  }
}
