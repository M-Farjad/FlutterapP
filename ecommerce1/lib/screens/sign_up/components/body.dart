import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/social_card.dart';
import '../../../constants.dart';
import 'sign_up_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Text(
              'Register Account',
              style: headingStyle,
            ),
            const Text(
              'Complete your details or continue\nwith social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            const SignUpForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: "assets/icons/google-icon.svg",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            const Text(
              'By Continuing you agree on our\nterms & conditions',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
