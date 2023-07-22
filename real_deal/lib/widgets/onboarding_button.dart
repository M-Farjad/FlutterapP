import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values/custom_colors.dart';
import '../values/styles.dart';
import '../values/values.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
  });
  _storedOnboaredInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = Get.find<SharedPreferences>();
    prefs.setInt(Strings.onboard, isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
      child: InkWell(
        onTap: () async {
          await _storedOnboaredInfo();
          Get.offAllNamed(NamedRoutes.welcome);
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          height: Get.height * .08,
          decoration: ShapeDecoration(
            color: CustomColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: CustomColors.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              Strings.getStarted,
              style: Styles.regularInter18(
                CustomColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
