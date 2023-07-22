import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/custom_colors.dart';

import '../controllers/login_controller.dart';
import '../values/strings.dart';
import '../values/styles.dart';

// ignore: must_be_immutable
class PasswordField extends StatelessWidget {
  PasswordField({
    Key? key,
    this.onTap,
  }) : super(key: key);
  VoidCallback? onTap;

  LoginController controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        onTap: onTap,
        controller: controller.passwordController,
        enableInteractiveSelection: true,
        obscureText: controller.obscureText.value,
        validator: (value) {
          if (value!.length < 8) {
            return 'Password must be greater than 8 digits';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              controller.toggleObscureText();
            },
            child: Obx(
              () => Icon(
                controller.obscureText.value
                    ? Icons.visibility
                    : Icons.visibility_off_rounded,
                color: Colors.grey,
                size: Get.width * 0.05,
              ),
            ),
          ),
          hintStyle: TextStyle(
            color: CustomColors.grey,
          ),
          hintText: Strings.yourPassword,
          filled: true,
          fillColor: CustomColors.fieldFillColor,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: Styles.regularInter12(CustomColors.normalTextColor),
      ),
    );
  }
}
