import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/screens/welcome/widgets/login_button.dart';
import 'package:real_deal/values/values.dart';
import 'package:real_deal/widgets/background_shape.dart';
import 'package:real_deal/widgets/top_onboarding_row.dart';

import '../../controllers/login_controller.dart';
import '../../values/custom_colors.dart';
import '../../values/ontap_scroller.dart';
import '../../values/spacing.dart';
import '../../values/strings.dart';
import '../../values/styles.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/onboarding_image.dart';
import '../../widgets/onbording_choice_text.dart';
import '../../widgets/phone_number_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final controller = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

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
                      title: Strings.register,
                    ),
                    Spacing.vertical(.02),
                    Text(Strings.phone,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacing.vertical(.01),
                    PhoneNumberField(
                      // focusNode: _phoneNumberFocusNode,
                      onTap: () =>
                          onTapScroller(scrollController: _scrollController),
                    ),
                    Spacing.vertical(.01),
                    CustomMainButton(
                        onTap: () => controller.handleRegister(_formKey),
                        text: Strings.register),
                    Spacing.vertical(.02),
                    OnBoardingChoiceText(
                      choiceText: Strings.login,
                      text: Strings.alreadyHaveAccount,
                      onTap: () {
                        // Get.back();
                        Get.off(NamedRoutes.login);
                      },
                    ),
                    Spacing.vertical(.12),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
