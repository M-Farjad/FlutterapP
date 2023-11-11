import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_suffixIcon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? cnfrmPassword;

  final List<String> errors = [];
  bool isEmail(String input) => EmailValidator.validate(input);
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            BuildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            BuildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            BuildConfirmPassFormField(),
            SizedBox(height: getProportionateScreenHeight(50)),
            FormError(errors: errors),
            DefaultButton(
                raisedButtonStyle: raisedButtonStyle,
                text: 'Continue',
                press: () {
                  if (_formKey.currentState!.validate()) {
                    //go to profile page;
                    // _formKey.currentState!.save();
                    Navigator.pushNamed(context, CompleteProfile.routeName);
                  }
                })
          ],
        ));
  }

  TextFormField BuildConfirmPassFormField() {
    return TextFormField(
      onSaved: (newValue) => cnfrmPassword = newValue,
      onChanged: (value) {
        if (password == value && errors.contains(kMatchPassError)) {
          setState(() {
            //Only Runs when both of the passwords are same
            // cnfrmPassword = value;
            errors.remove(kMatchPassError);
            errors.remove(kCnfrmPassNullError);
          });
        }
        // else {
        //   cnfrmPassword = value;
        // }
      },
      validator: (value) {
        if (value!.isEmpty) {
          // removeError(error: kMatchPassError);
          addError(error: kCnfrmPassNullError);
          return "";
        } else if (password != value) {
          //password != cnfrmPassword
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
        label: Text("Confirm Password"),
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/lock.svg"),
        hintText: "Re-Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField BuildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8) {
          setState(() {
            errors.remove(kShortPassError);
          });
          // removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
        label: Text("Password"),
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/lock.svg"),
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField BuildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
        // removeError(error: kEmailNullError);
        else if (isEmail(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!isEmail(value)) {
          addError(error: kInvalidEmailError);
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
