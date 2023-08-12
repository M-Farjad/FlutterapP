import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/strings.dart';

import '../../../values/assets.dart';
import '../../../values/custom_colors.dart';
import 'social_button_row.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Ink(
        width: double.infinity,
        height: 38,
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.75, color: CustomColors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SocialButtonRow(
          assetName: Assets.google,
          text: Strings.google,
          color: const Color(0xFF4F4F4F),
        ),
      ),
    );
  }
}
