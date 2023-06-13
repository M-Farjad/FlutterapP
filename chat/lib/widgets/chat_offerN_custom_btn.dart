import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool isToggled;
  final Function() onPressed;
  final String asset;
  final String label;
  final Color buttonColor;

  const CustomElevatedButton({
    Key? key,
    required this.isToggled,
    required this.onPressed,
    required this.asset,
    required this.label,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = isToggled ? buttonColor : Colors.white;
    final Color unselectedColor = isToggled ? Colors.white : buttonColor;
    final Color borderColor = buttonColor;

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(asset),
      label: Text(
        label,
        style: TextStyle(
          fontSize: mq.width * .03,
          color: isToggled ? Colors.white : unselectedColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedColor,
        // padding: EdgeInsets.symmetric(
        //   horizontal: mq.width * .08,
        //   vertical: mq.height * .01,
        // ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
