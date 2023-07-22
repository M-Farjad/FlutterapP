import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../values/custom_colors.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../values/values.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: CustomColors.lightPrimaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.75, color: CustomColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: InkWell(
        splashColor: CustomColors.lightPrimaryColor,
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.offAllNamed(NamedRoutes.register);
        },
        child: Center(
          child: Text(
            Strings.register,
            style: Styles.regularInter18(
              CustomColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
