import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../values/assets.dart';
import '../values/custom_colors.dart';
import '../controllers/login_controller.dart';
import '../values/strings.dart';
import '../values/styles.dart';
import '../screens/forget_password/widgets/send_otp_btn.dart';

// ignore: must_be_immutable
class PhoneNumberField extends StatelessWidget {
  PhoneNumberField({
    super.key,
    this.screenName,
    this.onTap,
    // this.focusNode,
  });

  final LoginController controller = Get.find<LoginController>();
  String? screenName;
  VoidCallback? onTap;

  // FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          onTap: onTap,
          // focusNode: focusNode,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 11,
          validator: (value) {
            if (value!.length != 11) {
              return Strings.phoneValidation;
            }
            return null;
          },
          controller: controller.phoneNumberController,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: CustomColors.grey,
            ),
            hintText: Strings.samplephone,
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
        screenName == 'otp'
            ? const SendOTPbtn()
            : screenName == Strings.profile
                ? Positioned(
                    right: 15,
                    top: 17,
                    child: SvgPicture.asset(Assets.verifiedCheck))
                : const SizedBox(),
      ],
    );
  }
}
