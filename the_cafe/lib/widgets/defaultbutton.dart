import 'package:flutter/material.dart';
import 'package:the_cafe/size_config.dart';

class defaultButton extends StatelessWidget {
  const defaultButton({
    super.key,
    required this.text,
    required this.press,
    required this.width,
  });
  final String text;
  final VoidCallback press;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          side: BorderSide(
            style: BorderStyle.none,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(11)))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(6), horizontal: width),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(22),
          ),
        ),
      ),
    );
  }
}
