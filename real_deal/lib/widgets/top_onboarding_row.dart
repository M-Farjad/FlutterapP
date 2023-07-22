import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/custom_colors.dart';
import '../values/spacing.dart';
import '../values/strings.dart';
import '../values/styles.dart';

class TopOnBoardingRow extends StatelessWidget {
  const TopOnBoardingRow({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacing.vertical(.12),
            Text(
              title,
              style: title == Strings.forgetPassword
                  ? Styles.regularInter24(
                      CustomColors.white,
                      fontWeight: FontWeight.w700,
                    )
                  : Styles.regularInter34(
                      CustomColors.white,
                      fontWeight: FontWeight.w700,
                    ),
            ),
          ],
        ),
        // SvgPicture.asset(
        //   title == Strings.location
        //       ? 'assets/images/Vector.svg'
        //       : 'assets/images/login-character.svg',
        //   width: title == Strings.verification
        //       ? Get.width * 0.33
        //       : title == Strings.registration || title == 'Forget Password'
        //           ? Get.width * 0.30
        //           : null,
        // )
        Expanded(
          child: SizedBox(
            height: Get.height * .4,
            // width: Get.width * .3,
          ),
        )
      ],
    );
  }
}
