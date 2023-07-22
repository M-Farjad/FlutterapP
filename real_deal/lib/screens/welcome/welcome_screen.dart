import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/shadows.dart';

import '../../values/assets.dart';
import '../../values/spacing.dart';
import '../../values/strings.dart';
import '../../values/values.dart';
import '../../widgets/background_shape.dart';
import '../../widgets/real_deal.dart';
import 'widgets/facebook_button.dart';
import 'widgets/google_button.dart';
import 'widgets/login_button.dart';
import 'widgets/register_button.dart';
import 'widgets/welcome_buttons_divider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kWhiteColor,
      body: Stack(
        children: [
          const BackgroundShape(),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Spacing.vertical(.1),
                const RealDealTitleNLogo(),
                Spacing.vertical(.09),
                Container(
                  decoration: ShapeDecoration(
                    shape: const OvalBorder(),
                    shadows: CustomShadows.shadows,
                  ),
                  child: Image.asset(
                    Assets.welcomeFoods,
                    fit: BoxFit.fill,
                  ),
                ),
                Spacing.vertical(.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
                  child: Column(
                    children: [
                      CustomMainButton(
                        onTap: () => Get.offAllNamed(NamedRoutes.login),
                        text: Strings.login,
                      ),
                      Spacing.vertical(.02),
                      const RegisterButton(),
                      Spacing.vertical(.02),
                      const WelcomeButtonsDivider(),
                      Spacing.vertical(.02),
                      const GoogleButton(),
                      Spacing.vertical(.02),
                      const FacebookButton()
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
