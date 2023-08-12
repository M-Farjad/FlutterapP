import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/custom_colors.dart';

class BackgroundShape extends StatelessWidget {
  const BackgroundShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // left: -158,
      // top: -112,
      // right: -50,
      right: -Get.width * .2,
      left: -Get.width * .5,
      top: -Get.height * .2,
      bottom: Get.height * .44,
      child: Container(
        decoration: ShapeDecoration(
          color: CustomColors.primaryColor,
          shape: const OvalBorder(),
        ),
      ),
    );
  }
}

class HomeBackgroundShape extends StatelessWidget {
  const HomeBackgroundShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -Get.width * .7,
      left: -Get.width * .7,
      top: -Get.height * .2,
      bottom: 1030,
      child: Container(
        decoration: ShapeDecoration(
          color: CustomColors.primaryColor,
          shape: const OvalBorder(),
        ),
      ),
    );
  }
}
