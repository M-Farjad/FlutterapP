import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  Text(
                    'OTP Verification',
                    style: headingStyle,
                  ),
                  const Text('We send your code to +92 000 0000 000'),
                  buildTimer(),
                  SizedBox(height: SizeConfig.screenHeight * 0.15),
                  OTPform(),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  GestureDetector(
                    onTap: () {
                      //resend your otp
                    },
                    child: Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This code will get expired in: '),
        TweenAnimationBuilder(
            tween: IntTween(begin: 30, end: 0),
            duration: Duration(seconds: 30),
            builder: (context, value, child) => Text(
                  "00:${value.toInt()}",
                  style: const TextStyle(color: kPrimaryColor),
                ),
            onEnd: () {}),
      ],
    );
  }
}
