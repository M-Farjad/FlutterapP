import 'package:flutter/material.dart';
import 'package:ecommerce/size_config.dart';
import 'package:ecommerce/constants.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  backgroundColor: kPrimaryColor,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.raisedButtonStyle,
    required this.text,
    required this.press,
  }) : super(key: key);

  final ButtonStyle raisedButtonStyle;
  final String text;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: getProportionateScreenWidth(18)),
        ),
      ),
      // TextButton.styleFrom(
      //     backgroundColor: kPrimaryColor),
    );
  }
}
