import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/login_screen/login_success_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_suffixIcon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;

  final List<String> errors = [];
  //For Input Validation
  bool isEmail(String input) => EmailValidator.validate(input);
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 28),
        child: Column(
          children: [
            buildTextInputField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordInputField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                const Text('Remember me'),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            DefaultButton(
                raisedButtonStyle: raisedButtonStyle,
                text: "Continue",
                press: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    //if all are valid then move to login success screen
                    Navigator.pushNamed(context, LoginSuccesScreen.routeName);
                  }
                })
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordInputField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      // keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
        label: Text("Password"),
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/lock.svg"),
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildTextInputField() {
    return TextFormField(
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

        else if (isEmail(value) && errors.contains(kInvalidEmailError)) {
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
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text("Email"),
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/mail.svg"),
        hintText: "Enter Your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
