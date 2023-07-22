import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values/assets.dart';
import '../values/strings.dart';
import '../values/styles.dart';
import '../values/values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences prefs = Get.find<SharedPreferences>();
  int? isViewed;

  @override
  void initState() {
    super.initState();
    isViewed = prefs.getInt(Strings.onboard);
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(
        isViewed == null ? NamedRoutes.onboard : NamedRoutes.welcome,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(Assets.splashLogo),
            Text(
              Strings.appTitle,
              textAlign: TextAlign.center,
              style: Styles.regularMonteAlt28(
                CustomColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
