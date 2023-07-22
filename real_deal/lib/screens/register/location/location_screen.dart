import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/controllers/login_controller.dart';

import '../../../values/custom_colors.dart';
import '../../../values/ontap_scroller.dart';
import '../../../values/spacing.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../widgets/background_shape.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/onboarding_image.dart';
import '../../../widgets/top_onboarding_row.dart';
import '../../welcome/widgets/login_button.dart';
import '../registration/name_field.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final controller = Get.find<LoginController>();
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
            OnboardingImage(title: Strings.location),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopOnBoardingRow(
                      title: Strings.location,
                    ),
                    Text(
                      Strings.enterLocation,
                      style: Styles.regularInter13(const Color(0xFF797979)),
                    ),
                    Spacing.vertical(.01),
                    Text(Strings.address,
                        style: Styles.regularInter14(
                          CustomColors.normalTextColor,
                          fontWeight: FontWeight.w500,
                        )),
                    Spacing.vertical(.01),
                    AddressField(
                        onTap: () =>
                            onTapScroller(scrollController: _scrollController)),
                    Spacing.vertical(.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            Strings.city,
                            style: Styles.regularInter14(
                              CustomColors.normalTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Spacing.horizontal(.08),
                        Expanded(
                          child: Text(
                            Strings.postalCode,
                            style: Styles.regularInter14(
                              CustomColors.normalTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacing.vertical(.01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CityField(
                            onTap: () => onTapScroller(
                                scrollController: _scrollController)),
                        Spacing.horizontal(.08),
                        PcodeField(
                            onTap: () => onTapScroller(
                                scrollController: _scrollController)),
                      ],
                    ),
                    Spacing.vertical(.05),
                    CustomMainButton(
                        onTap: () => controller.handleLocation(_formKey),
                        text: Strings.continuee),
                    Spacing.vertical(.04),
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
