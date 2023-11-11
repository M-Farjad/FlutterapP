import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'complete_profile_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Text(
              "Complete Profile",
              style: headingStyle,
            ),
            const Text(
              'Complete your details or conitnue with\nsocial media',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            const CompleteProfileForm(),
            SizedBox(height: getProportionateScreenHeight(30)),
            const Text(
              'By conituining you confirm that you agree\nwith our Terms & condition',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
