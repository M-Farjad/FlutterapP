import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/login_controller.dart';
import '../../../values/custom_colors.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';

// ignore: must_be_immutable
class VerificationCodeField extends StatelessWidget {
  VerificationCodeField({super.key, this.onTap});

  final LoginController controller = Get.find<LoginController>();
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onTap: onTap,
      // onChanged: (_) {
      //   Form.of(context).validate();
      // },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6),
      ],
      maxLength: 6,
      controller: controller.verificationController,
      validator: (value) {
        if (value!.length != 6) {
          return Strings.otpValidation;
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: Styles.regularInter10(CustomColors.grey),
        hintText: Strings.otpText,
        filled: true,
        fillColor: CustomColors.fieldFillColor,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: Styles.regularInter12(CustomColors.normalTextColor),
    );
  }
}
