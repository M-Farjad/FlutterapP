import 'package:flutter/material.dart';
import 'package:real_deal/values/shadows.dart';

import '../../../values/custom_colors.dart';
import '../../../values/styles.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: CustomColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: CustomShadows.shadows,
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: CustomColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        child: Center(
          child: Text(
            text,
            style: Styles.regularInter18(
              CustomColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
