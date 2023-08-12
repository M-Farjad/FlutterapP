import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/widgets/password_field.dart';
import 'package:real_deal/widgets/phone_number_field.dart';
import 'package:real_deal/values/strings.dart';

import '../../controllers/forgetpassword_controller.dart';
import '../../values/custom_colors.dart';
import '../../values/ontap_scroller.dart';
import '../../values/spacing.dart';
import '../../values/styles.dart';
import '../../widgets/background_shape.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/onboarding_image.dart';
import '../../widgets/top_onboarding_row.dart';
import 'widgets/verification_field.dart';
import '../onboarding/widgets/login_button.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({super.key});
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final ForgetPasswordController controller =
      Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: _scrollController,
          child: Stack(
            children: [
              const BackgroundShape(),
              OnboardingImage(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopOnBoardingRow(
                        title: Strings.forgetPassword,
                      ),
                      Spacing.vertical(.01),
                      Text(
                        Strings.phone,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Spacing.vertical(.01),
                      PhoneNumberField(
                        screenName: 'otp',
                        controller: controller,
                        txtcontroller: controller.phoneNumberController,
                        onTap: () =>
                            onTapScroller(scrollController: _scrollController),
                      ),
                      // Spacing.vertical(.01),
                      Text(
                        Strings.otpText,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Spacing.vertical(.01),
                      VerificationCodeField(
                        controller: controller.otpController,
                        onTap: () =>
                            onTapScroller(scrollController: _scrollController),
                      ),
                      Text(
                        Strings.newPassword,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Spacing.vertical(.01),
                      PasswordField(
                        codeController: controller.passwordController,
                        onTap: () =>
                            onTapScroller(scrollController: _scrollController),
                      ),
                      Spacing.vertical(.014),
                      CustomMainButton(
                          onTap: () =>
                              controller.handleForgetPassword(_formKey),
                          text: Strings.continuee),
                      // Spacing.vertical(.01),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
