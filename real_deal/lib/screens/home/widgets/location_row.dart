import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';
import '../../../values/assets.dart';
import '../../../values/custom_colors.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';

class LocationRow extends StatelessWidget {
  LocationRow({
    super.key,
  });

  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.location),
          Text(
            Strings.location,
            style: Styles.regularInter12(
              CustomColors.white,
              letterSpacing: .3,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              controller.address.value,
              overflow: TextOverflow.ellipsis,
              style: Styles.regularInter12(
                CustomColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SvgPicture.asset(Assets.down),
        ],
      ),
    );
  }
}
