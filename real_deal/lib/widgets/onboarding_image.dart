import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../values/assets.dart';
import '../values/strings.dart';

// ignore: must_be_immutable
class OnboardingImage extends StatelessWidget {
  OnboardingImage({
    super.key,
    this.title,
  });
  String? title;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: title == Strings.registration
          ? Get.width * .03
          : title == Strings.location
              ? -Get.width * .01
              : Get.width * .06,
      child: title == Strings.location
          ? Image.asset(
              Assets.businessWomanLocation,
              width: Get.width * .9,
            )
          : SvgPicture.asset(Assets.loginChar),
    );
  }
}
