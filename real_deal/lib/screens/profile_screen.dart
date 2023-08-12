import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/widgets/default_appbar.dart';

import '../controllers/profile_controller.dart';
import '../widgets/password_field.dart';
import '../widgets/phone_number_field.dart';
import 'login auth/widgets/registration_fields.dart';
import '../values/custom_colors.dart';
import '../values/shadows.dart';
import '../values/spacing.dart';
import '../values/strings.dart';
import '../values/styles.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: Text(
          Strings.myProfile,
          textAlign: TextAlign.center,
          style: Styles.regularInter24(CustomColors.black),
        ),
        leading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
          child: SingleChildScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.vertical(.01),
                Text(
                  Strings.firstName,
                  style: Styles.regularInter14(
                    CustomColors.normalTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacing.vertical(.01),
                NameField(
                  isFirstName: true,
                  register: false,
                ),
                Spacing.vertical(.01),
                Text(
                  Strings.lastName,
                  style: Styles.regularInter14(
                    CustomColors.normalTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacing.vertical(.01),
                NameField(isFirstName: false, register: false),
                Spacing.vertical(.02),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    Strings.mobile,
                    textAlign: TextAlign.center,
                    style: Styles.regularInter16(
                      CustomColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  Strings.phone,
                  style: Styles.regularInter14(
                    CustomColors.normalTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                PhoneNumberField(
                  screenName: Strings.profile,
                  controller: controller,
                  // txtcontroller: controller.phoneNumberController,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    Strings.address,
                    textAlign: TextAlign.center,
                    style: Styles.regularInter16(
                      CustomColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  Strings.address,
                  style: Styles.regularInter14(
                    CustomColors.normalTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AddressField(register: false),
                Spacing.vertical(.01),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    Strings.password,
                    textAlign: TextAlign.center,
                    style: Styles.regularInter16(
                      CustomColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  Strings.currentPassword,
                  style: Styles.regularInter14(
                    CustomColors.normalTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacing.vertical(.01),
                PasswordField(codeController: controller.currentPassController),
                Spacing.vertical(.01),
                Text(
                  Strings.newPassword,
                  style: Styles.regularInter14(
                    CustomColors.normalTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacing.vertical(.01),
                PasswordField(codeController: controller.newPasswordcontroller),
                Spacing.vertical(.02),
                Center(
                  child: Container(
                    width: 146,
                    height: 54,
                    decoration: ShapeDecoration(
                      color: CustomColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: CustomShadows.shadows,
                    ),
                    child: Center(
                      child: Text(
                        Strings.save,
                        style: Styles.regularInter18(
                          CustomColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacing.vertical(.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
