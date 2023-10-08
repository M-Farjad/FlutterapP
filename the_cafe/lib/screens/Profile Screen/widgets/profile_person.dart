import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/size_config.dart';

class ProfilePerson extends StatelessWidget {
  const ProfilePerson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(300),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              width: SizeConfig.screenWidth - getProportionateScreenWidth(30),
              height: getProportionateScreenHeight(250),
              decoration: BoxDecoration(
                color: Color.fromARGB(71, 0, 0, 0),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: getProportionateScreenHeight(35),
            right: getProportionateScreenWidth(35),
            child: Icon(
              Icons.edit_document,
              color: Color.fromARGB(255, 110, 108, 108),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Ellipse 1.png',
                  width: getProportionateScreenHeight(110),
                  height: getProportionateScreenWidth(100),
                  fit: BoxFit.fill,
                ),
                Text(
                  'Muzammil Iftikhar',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                Text(
                  'Immuzammil1999"gmail.com',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
