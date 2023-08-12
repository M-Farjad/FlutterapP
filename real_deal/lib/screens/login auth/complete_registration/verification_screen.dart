import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_controller.dart';
import '../../../values/custom_colors.dart';
import '../../../values/ontap_scroller.dart';
import '../../../values/spacing.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../widgets/background_shape.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/onboarding_image.dart';
import '../../../widgets/top_onboarding_row.dart';
import '../../onboarding/widgets/login_button.dart';
import '../widgets/verification_field.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final RegisterController controller = Get.find<RegisterController>();
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
                      TopOnBoardingRow(title: Strings.verification),
                      Spacing.vertical(.01),
                      Text(
                        Strings.enterVerifycode,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacing.vertical(.01),
                      VerificationCodeField(
                          controller: controller.otpController,
                          onTap: () => onTapScroller(
                              scrollController: _scrollController)),
                      Spacing.vertical(.02),
                      CustomMainButton(
                          onTap: () => controller.handleVerification(_formKey),
                          text: Strings.continuee),
                      Spacing.vertical(.17),
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
