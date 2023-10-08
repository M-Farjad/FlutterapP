import 'package:flutter/material.dart';
import 'package:the_cafe/size_config.dart';

const primaryColor = Color.fromARGB(255, 61, 7, 92);
const secondaryColor = Color.fromARGB(255, 61, 7, 92);
const onPrimaryColor = Colors.white;
const onSecondaryColor = Colors.white;
const textfieldColor = Colors.grey;
const smalltextColor = Color.fromARGB(110, 0, 0, 0);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final headingtext = TextStyle(
    fontSize: getProportionateScreenWidth(40),
    color: primaryColor,
    fontWeight: FontWeight.w600);
final bodytext = TextStyle(fontWeight: FontWeight.w400);

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String kEmailNullError = 'Please Enter your email';
const String kInvalidEmailError = 'Please Enter valid email';
const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = 'Passwords don\'t match';
const String kNameNullError = 'Please Enter your name';
const String kPhoneNumberNullError = 'Please enter your phone number';
const String kAddressNullError = 'Please enter your address';
const String kUsernameError = 'Please enter username';
const String kInvalidUsername = 'Please enter valid username';
const String kShortUsername = 'Username is less than 6 characters';
const String confirmEmailError = 'Confirm Email does not match';
const String confirmPasswordError = 'Confirm Password does not match';
