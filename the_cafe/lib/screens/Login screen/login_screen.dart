import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/screens/Categories%20screen/categories_screen.dart';
import 'package:the_cafe/screens/Sign%20up%20screen/sign_up_screen.dart';
import 'package:the_cafe/size_config.dart';
import 'package:the_cafe/widgets/defaultbutton.dart';
import 'package:the_cafe/widgets/form_error.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  bool rememberMe = false;
  final List<String> errors = [];
  String? username;
  String? password;
  Color usercolor = Colors.grey;
  Color passcolor = Colors.grey;
  Color rmcolor = Colors.black;

  void handleRememberMe(bool value) {
    setState(() {
      rememberMe = value;
      if (rememberMe) rmcolor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Center(
                child: Text(
                  'Welcome back',
                  style: headingtext,
                ),
              ),
              Center(
                child: Text(
                  'Please enter your details to login',
                  style: bodytext,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(30)),
                  child: Column(
                    children: [
                      usernameTextField(),
                      passwordTextField(),
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
                          Spacer(),
                          Text('Forgot password'),
                        ],
                      ),
                      FormError(errors: errors),
                      SizedBox(
                        height: getProportionateScreenHeight(80),
                      ),
                      defaultButton(
                        text: 'Login',
                        press: () {
                          if (_formkey.currentState!.validate() &&
                              rememberMe == true) {
                            _formkey.currentState!.save();

                            Navigator.pushNamed(
                                context, CategoriesScreen.routeName);
                          } else if (rememberMe == false) {
                            setState(() {
                              rmcolor = Colors.red;
                            });
                          }
                        },
                        width: getProportionateScreenWidth(100),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                        //height: 20,
                      ),
                      defaultButton(
                        text: 'Sign up',
                        press: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        width: getProportionateScreenWidth(90),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField usernameTextField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kUsernameError)) {
          setState(() {
            errors.remove(kUsernameError);
            usercolor = Colors.grey;
          });
        } else if (value.length < 6 && errors.contains(kShortUsername)) {
          setState(() {
            errors.remove(kShortUsername);
            usercolor = Colors.grey;
          });
        } else if (value.isNotEmpty && value.length == 6) {
          setState(() {
            usercolor = const Color.fromARGB(255, 17, 66, 18);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kUsernameError)) {
          setState(() {
            errors.add(kUsernameError);
            usercolor = Colors.red;
          });
        } else if (value.isNotEmpty &&
            value.length < 6 &&
            !errors.contains(kShortUsername)) {
          setState(() {
            errors.add(kShortUsername);
            usercolor = Colors.red;
          });
        }
      },
      onSaved: (newValue) => username = newValue,
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
            color: usercolor,
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
}
