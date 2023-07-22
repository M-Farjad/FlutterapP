import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/strings.dart';
import 'package:real_deal/values/styles.dart';

import '../../../values/custom_colors.dart';

class WelcomeButtonsDivider extends StatelessWidget {
  const WelcomeButtonsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              color: Color(0xFF828282),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width * .02),
          child: Text(
            Strings.welcomeDivider,
            style: Styles.regularInter12(CustomColors.normalTextColor),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              color: Color(0xFF828282),
            ),
          ),
        ),
      ],
    );
  }
}
