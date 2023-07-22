import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../values/assets.dart';
import '../../../values/custom_colors.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';

class SeeMoreRow extends StatelessWidget {
  const SeeMoreRow({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.regularInter18(
              CustomColors.normalTextColor,
              fontWeight: FontWeight.w600,
              letterSpacing: .3,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  Strings.seeMore,
                  textAlign: TextAlign.center,
                  style: Styles.regularInter13(CustomColors.linksColor,
                      fontWeight: FontWeight.w500, letterSpacing: -.08),
                ),
                SvgPicture.asset(Assets.arrowRight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
