import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/components/no_account_text.dart';
import 'package:ecommerce/size_config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_suffixIcon.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Forgot Password',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(28),
            ),
          ),
          Text(
            'Please Enter your email and we will send\nyou a link to return to your account.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: getProportionateScreenHeight(14),
                color: Colors.black),
          ),
          ForgetPasswordForm()
        ],
      ),
    );
  }
}

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  List<String> errors = [];
  String? email;
  final _formKey = GlobalKey<FormState>();
  //For Input Validation
  bool isEmail(String input) => EmailValidator.validate(input);
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.2),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) => email = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                    setState(() {
                      errors.remove(kEmailNullError);
                    });
                  }
                  // else if (emailValidatorRegExp.hasMatch(value) &&
                  //     errors.contains(kInvalidEmailError)) {

                  else if (isEmail(value) &&
                      errors.contains(kInvalidEmailError)) {
                    setState(() {
                      errors.remove(kInvalidEmailError);
                    });
                  }
                  return null;
                },
                validator: (value) {
                  if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                    setState(() {
                      errors.add(kEmailNullError);
                    });
                  } else if (!emailValidatorRegExp.hasMatch(value) &&
                      !errors.contains(kInvalidEmailError)) {
                    setState(() {
                      errors.add(kInvalidEmailError);
                    });
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text("Email"),
                  suffixIcon:
                      CustomSuffixIcon(svgIcon: "assets/icons/mail.svg"),
                  hintText: "Enter Your Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              FormError(errors: errors),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              DefaultButton(
                  raisedButtonStyle: raisedButtonStyle,
                  text: 'Continue',
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      //Do whatever you want
                    }
                  }),
              const NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
