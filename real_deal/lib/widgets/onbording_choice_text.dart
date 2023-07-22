import 'package:flutter/material.dart';

import '../values/custom_colors.dart';

class OnBoardingChoiceText extends StatelessWidget {
  const OnBoardingChoiceText({
    super.key,
    required this.text,
    required this.choiceText,
    required this.onTap,
  });
  final String text, choiceText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            choiceText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
