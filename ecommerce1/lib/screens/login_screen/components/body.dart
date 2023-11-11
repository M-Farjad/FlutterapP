import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset('assets/images/success.png',
              height: SizeConfig.screenHeight * 0.4),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            'Login Success',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(30),
                color: Colors.black),
          ),
          // SizedBox(height: SizeConfig.screenHeight * 0.08),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
                raisedButtonStyle: raisedButtonStyle,
                text: 'Back To Home',
                press: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName)),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
