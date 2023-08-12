import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/widgets/password_field.dart';
import 'package:real_deal/widgets/background_shape.dart';
import 'package:real_deal/widgets/default_appbar.dart';

import '../../../controllers/register_controller.dart';
import '../../../values/custom_colors.dart';
import '../../../values/ontap_scroller.dart';
import '../../../values/spacing.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../widgets/onboarding_image.dart';
import '../../../widgets/top_onboarding_row.dart';
import '../../onboarding/widgets/login_button.dart';
import '../widgets/registration_fields.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final RegisterController controller = Get.find<RegisterController>();
  final GlobalKey<FormState> _formKey = GlobalKey();
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
              OnboardingImage(title: Strings.registration),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopOnBoardingRow(
                        title: Strings.registration,
                      ),
                      // Spacing.vertical( .04),
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
                          register: true,
                          onTap: () => onTapScroller(
                              scrollController: _scrollController)),
                      Text(
                        Strings.lastName,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacing.vertical(.01),
                      NameField(
                          register: true,
                          isFirstName: false,
                          onTap: () => onTapScroller(
                              scrollController: _scrollController)),
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
                          onTap: () => onTapScroller(
                              scrollController: _scrollController)),
                      Spacing.vertical(.02),
                      CustomMainButton(
                          onTap: () => controller.handleRegistration(_formKey),
                          text: Strings.continuee),
                      Spacing.vertical(.02),
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
