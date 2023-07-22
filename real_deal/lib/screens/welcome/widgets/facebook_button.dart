import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../values/assets.dart';
import '../../../values/custom_colors.dart';
import '../../../values/strings.dart';
import 'social_button_row.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: double.infinity,
        height: 38,
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        decoration: ShapeDecoration(
          color: const Color(0xFF2D9CDB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SocialButtonRow(
          assetName: Assets.facebook,
          text: Strings.facebook,
          color: CustomColors.white,
        ),
      ),
    );
  }
}
