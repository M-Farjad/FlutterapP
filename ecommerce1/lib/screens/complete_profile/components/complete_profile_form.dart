import 'package:flutter/material.dart';

import '../../../components/custom_suffixIcon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

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
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              buildFirstNameField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildLastNameField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPhoneField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildAddressField(),
              SizedBox(height: getProportionateScreenHeight(40)),
              FormError(errors: errors),
              DefaultButton(
                  raisedButtonStyle: raisedButtonStyle,
                  text: "Continue",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      //Move to OTP Page
                      Navigator.pushNamed(context,"/otp");
                    }
                  }),
            ],
          ),
        ));
  }

  TextFormField buildAddressField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text("Address"),
        suffixIcon:
            CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg"),
        hintText: "Enter Your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPhoneField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text("Phone #"),
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/phone.svg"),
        hintText: "Enter Your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: const InputDecoration(
        label: Text("Last Name"),
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/user.svg"),
        hintText: "Enter Your Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text("First Name"),
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/user.svg"),
        hintText: "Enter Your First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
