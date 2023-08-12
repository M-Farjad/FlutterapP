import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../../values/ontap_scroller.dart';
import '../../values/spacing.dart';
import '../../values/strings.dart';
import '../../values/styles.dart';

import '../../values/values.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/onboarding_image.dart';
import '../../widgets/onbording_choice_text.dart';
import '../../widgets/password_field.dart';
import '../../widgets/top_onboarding_row.dart';
import '../onboarding/widgets/login_button.dart';
import '/values/custom_colors.dart';
import '/widgets/background_shape.dart';
import '../../widgets/phone_number_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.find<LoginController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  // final FocusNode _phoneNumberFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                        title: Strings.login,
                      ),
                      Spacing.vertical(.01),
                      Text(
                        Strings.phone,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacing.vertical(.01),
                      PhoneNumberField(
                        controller: controller,
                        txtcontroller: controller.phoneNumberController,
                        onTap: () =>
                            onTapScroller(scrollController: _scrollController),
                      ),
                      Spacing.vertical(.015),
                      Text(
                        Strings.password,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacing.vertical(.01),
                      PasswordField(
                        codeController: controller.passwordController,
                        onTap: () =>
                            onTapScroller(scrollController: _scrollController),
                      ),
                      // Spacing.vertical( .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.offAllNamed(NamedRoutes.forgetPassword);
                            },
                            child: Text(
                              Strings.forgotPassword,
                              style: Styles.regularInter10(
                                  CustomColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      Spacing.vertical(.02),
                      CustomMainButton(
                        text: Strings.login,
                        onTap: () => controller.handleLogin(_formKey),
                      ),
                      Spacing.vertical(.02),
                      OnBoardingChoiceText(
                        choiceText: Strings.register,
                        text: Strings.notHaveAccount,
                        onTap: () {
                          // Get.back();
                          Get.offAllNamed(NamedRoutes.register);
                        },
                      ),
                      Spacing.vertical(.006),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
