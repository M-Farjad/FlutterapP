import 'package:flutter/material.dart';
import 'package:real_deal/values/custom_colors.dart';
import 'package:real_deal/values/shadows.dart';

import '../../../values/strings.dart';
import '../../../values/styles.dart';

class SendOTPbtn extends StatelessWidget {
  const SendOTPbtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80,
          // padding: EdgeInsets.symmetric(horizontal: Get.width * .01),
          height: 38,
          decoration: ShapeDecoration(
            color: CustomColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: CustomShadows.shadows,
          ),
          child: Center(
            child: Text(
              Strings.sendOtp,
              style: Styles.regularInter12(
                CustomColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
