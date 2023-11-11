import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn({
    Key? key,
    required this.icnData,
    required this.press,
  }) : super(key: key);
  final IconData icnData;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: icnData == Icons.arrow_back_ios
          ? EdgeInsets.only(top: 20)
          : EdgeInsets.all(0),
      width: getProportionateScreenWidth(40),
      height: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      // child: Padding(
      //   padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: press,
        splashColor: kPrimaryColor,
        focusColor: Colors.white,
        hoverColor: Color.fromARGB(255, 254, 162, 120),
        autofocus: true,
        child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
          child: Icon(icnData),
        ),
        // ),
      ),
    );
  }
}
