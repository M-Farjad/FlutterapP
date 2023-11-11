import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../home/home_screen.dart';

class OTPform extends StatefulWidget {
  const OTPform({super.key});

  @override
  State<OTPform> createState() => _OTPformState();
}

class _OTPformState extends State<OTPform> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focusNode}) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
                decoration: otpInputDecoration,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Also You need to store your value
                  nextField(value: value, focusNode: pin2FocusNode);
                },
              ),
              width: getProportionateScreenWidth(60),
            ),
            SizedBox(
              child: TextFormField(
                focusNode: pin2FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
                decoration: otpInputDecoration,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin3FocusNode);
                },
              ),
              width: getProportionateScreenWidth(60),
            ),
            SizedBox(
              child: TextFormField(
                focusNode: pin3FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
                decoration: otpInputDecoration,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin4FocusNode);
                },
              ),
              width: getProportionateScreenWidth(60),
            ),
            SizedBox(
              child: TextFormField(
                focusNode: pin4FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
                decoration: otpInputDecoration,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  pin4FocusNode!
                      .unfocus(); //THIS will ensure that eye don't show up
                },
              ),
              width: getProportionateScreenWidth(60),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.15),
        DefaultButton(
            raisedButtonStyle: raisedButtonStyle,
            text: "Continue",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            }),
      ],
    );
  }
}
