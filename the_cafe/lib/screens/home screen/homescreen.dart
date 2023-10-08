import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/screens/Login%20screen/login_screen.dart';
import 'package:the_cafe/screens/Sign%20up%20screen/sign_up_screen.dart';
import 'package:the_cafe/size_config.dart';
import 'package:the_cafe/widgets/defaultbutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Image.asset(
              'assets/13 Pro - 1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 50,
            right: 1,
            left: 1,
            child: Column(
              children: [
                defaultButton(
                  text: 'Login',
                  press: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  width: getProportionateScreenWidth(100),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create a new account  ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
