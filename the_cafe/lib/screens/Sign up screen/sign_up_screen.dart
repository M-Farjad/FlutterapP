import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/screens/Login%20screen/login_screen.dart';
import 'package:the_cafe/size_config.dart';
import 'package:the_cafe/widgets/defaultbutton.dart';
import 'package:the_cafe/widgets/form_error.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static String routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool termsConditions = false;
  final List<String> errors = [];
  String? fullname;
  String? email;
  String? confirmemail;
  String? password;
  String? confirmpassword;
  Color namecolor = Colors.grey;
  Color emailcolor = Colors.grey;
  Color conmailcolor = Colors.grey;
  Color passcolor = Colors.grey;
  Color conpasscolor = Colors.grey;
  Color rmcolor = Colors.black;
  Color tccolor = Colors.black;

  void handleRememberMe(bool value) {
    setState(() {
      rememberMe = value;
      if (rememberMe) rmcolor = Colors.black;
    });
  }

  void handleTermsConditions(bool value) {
    setState(() {
      termsConditions = value;
      if (termsConditions) tccolor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Center(
                child: Text(
                  'Sign up',
                  style: headingtext,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Form(
                  key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(30)),
                    child: Column(
                      children: [
                        FullName(),
                        Email(),
                        ConfirmEmail(),
                        passwordTextField(),
                        ConfirmpasswordTextField(),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                handleRememberMe(value!);
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(color: rmcolor),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: termsConditions,
                              onChanged: (value) {
                                handleTermsConditions(value!);
                              },
                            ),
                            Text(
                              'Agree terms and conditions',
                              style: TextStyle(color: tccolor),
                            ),
                          ],
                        ),
                        FormError(errors: errors),
                        SizedBox(
                          height: getProportionateScreenHeight(50),
                        ),
                        defaultButton(
                          text: 'Sign up',
                          press: () {
                            if (_formkey.currentState!.validate() &&
                                rememberMe == true &&
                                termsConditions == true) {
                              _formkey.currentState!.save();

                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            } else if (rememberMe == false &&
                                termsConditions == true) {
                              setState(() {
                                rmcolor = Colors.red;
                                tccolor = Colors.black;
                              });
                            } else if (rememberMe == true &&
                                termsConditions == false) {
                              setState(() {
                                tccolor = Colors.red;
                                rmcolor = Colors.black;
                              });
                            } else if (rememberMe == false &&
                                termsConditions == false) {
                              setState(() {
                                rmcolor = Colors.red;
                                tccolor = Colors.red;
                              });
                            }
                          },
                          width: getProportionateScreenWidth(90),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  TextFormField Email() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
            emailcolor = Colors.grey;
          });
        } else if (errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
            emailcolor = Colors.grey;
          });
        } else if (value.isNotEmpty && emailValidatorRegExp.hasMatch(value)) {
          setState(() {
            email = value;
            emailcolor = const Color.fromARGB(255, 17, 66, 18);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
            emailcolor = Colors.red;
          });
        } else if (value.isNotEmpty &&
            !emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
            emailcolor = Colors.red;
          });
        }
      },
      onSaved: (newValue) => email = newValue,
      decoration: InputDecoration(
        hintText: 'Email',
        enabledBorder: UnderlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.person,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.done_all,
            color: emailcolor,
          ),
        ),
      ),
    );
  }

  TextFormField ConfirmEmail() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(confirmEmailError)) {
          setState(() {
            errors.remove(confirmEmailError);
            conmailcolor = Colors.grey;
          });
        } else if (value.isNotEmpty && value == email) {
          setState(() {
            conmailcolor = const Color.fromARGB(255, 17, 66, 18);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(confirmEmailError)) {
          setState(() {
            errors.add(confirmEmailError);
            conmailcolor = Colors.red;
          });
        }
      },
      onSaved: (newValue) => confirmemail = newValue,
      decoration: InputDecoration(
        hintText: 'Confirm Email',
        enabledBorder: UnderlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.person,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.done_all,
            color: conmailcolor,
          ),
        ),
      ),
    );
  }

  TextFormField FullName() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kUsernameError)) {
          setState(() {
            errors.remove(kUsernameError);
            namecolor = Colors.grey;
          });
        } else if (value.length < 6 && errors.contains(kShortUsername)) {
          setState(() {
            errors.remove(kShortUsername);
            namecolor = Colors.grey;
          });
        } else if (value.isNotEmpty && value.length == 6) {
          setState(() {
            namecolor = const Color.fromARGB(255, 17, 66, 18);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kUsernameError)) {
          setState(() {
            errors.add(kUsernameError);
            namecolor = Colors.red;
          });
        } else if (value.isNotEmpty &&
            value.length < 6 &&
            !errors.contains(kShortUsername)) {
          setState(() {
            errors.add(kShortUsername);
            namecolor = Colors.red;
          });
        }
      },
      onSaved: (newValue) => fullname = newValue,
      decoration: InputDecoration(
        hintText: 'Username',
        enabledBorder: UnderlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.person,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.done_all,
            color: namecolor,
          ),
        ),
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
            passcolor = Colors.grey;
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        } else if (value.length == 8) {
          setState(() {
            passcolor = const Color.fromARGB(255, 17, 66, 18);
            password = value;
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
            passcolor = Colors.red;
          });
          return '';
        } else if (value.isNotEmpty &&
            value.length < 8 &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
            passcolor = Colors.red;
          });
          return '';
        }
        return null;
      },
      onSaved: (newValue) => password = newValue,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        enabledBorder: UnderlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(Icons.lock_outline),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.visibility_outlined,
            color: passcolor,
          ),
        ),
      ),
    );
  }

  TextFormField ConfirmpasswordTextField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(confirmPasswordError)) {
          setState(() {
            errors.remove(confirmPasswordError);
            conpasscolor = Colors.grey;
          });
        } else if (value.isNotEmpty && value == password) {
          setState(() {
            conpasscolor = const Color.fromARGB(255, 17, 66, 18);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(confirmPasswordError)) {
          setState(() {
            errors.add(confirmPasswordError);
            conpasscolor = Colors.red;
          });
          return '';
        }
        return null;
      },
      onSaved: (newValue) => password = newValue,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        enabledBorder: UnderlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(Icons.lock_outline),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.visibility_outlined,
            color: conpasscolor,
          ),
        ),
      ),
    );
  }
}
