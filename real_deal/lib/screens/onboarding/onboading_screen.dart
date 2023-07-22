import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../values/assets.dart';
import '../../values/custom_colors.dart';
import '../../values/spacing.dart';
import '../../values/strings.dart';
import '../../values/styles.dart';
import '../../widgets/background_shape.dart';
import '../../widgets/onboarding_button.dart';
import '../../widgets/real_deal.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Stack(
        children: [
          const BackgroundShape(),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Spacing.vertical(.1),
                  const RealDealTitleNLogo(),
                  Spacing.vertical(.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.onbordChar1),
                      SvgPicture.asset(Assets.onbordChar2),
                    ],
                  ),
                  Spacing.vertical(.1),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.onboarding1,
                          style: Styles.regularInter18(
                              CustomColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: Strings.onboarding2,
                          style: Styles.regularInter18(
                              CustomColors.primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: Strings.onboarding3,
                          style: Styles.regularInter18(
                              CustomColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Spacing.vertical(.06),
                  const OnBoardingButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
