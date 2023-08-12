import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/custom_colors.dart';
import 'package:real_deal/values/styles.dart';
import 'package:real_deal/values/values.dart';

import '../../../controllers/main_controller.dart';
import '../../../values/assets.dart';
import '../../../values/shadows.dart';
import '../../../values/spacing.dart';
import '../../../values/strings.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final MainScreenController controller = Get.find<MainScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * .1),
      // height: Get.height * 0.7,
      width: Get.width * .6,
      child: Drawer(
        child: Container(
          decoration: ShapeDecoration(
            color: CustomColors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            shadows: CustomShadows.shadows,
          ),
          // color: CustomColors.whiteColor, // Set the desired background color
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: Get.height * .05),
            children: <Widget>[
              ListTile(
                title: Text(
                  Strings.orders,
                  style: Styles.regularInter16(CustomColors.black),
                ),
                leading: SvgPicture.asset(Assets.listOrders),
                onTap: () {
                  // Handle item 1 tap
                },
              ),
              Spacing.vertical(.01),
              ListTile(
                title: Text(
                  Strings.referFriend,
                  style: Styles.regularInter16(CustomColors.black),
                ),
                leading: SvgPicture.asset(Assets.distributor),
                onTap: () {
                  //move to cart for refer a friend
                  controller.updateSelectedIndex(2);
                },
              ),
              Spacing.vertical(.01),
              ListTile(
                title: Text(
                  Strings.help,
                  style: Styles.regularInter16(CustomColors.black),
                ),
                leading: SvgPicture.asset(Assets.help),
                onTap: () {
                  // Handle item 2 tap
                },
              ),
              Spacing.vertical(.01),
              ListTile(
                title: Text(
                  Strings.privacyPolicy,
                  style: Styles.regularInter16(CustomColors.black),
                ),
                leading: SvgPicture.asset(Assets.privacyDocument),
                onTap: () {
                  // Handle item 2 tap
                },
              ),
              Spacing.vertical(.01),
              ListTile(
                title: Text(
                  Strings.logout,
                  style: Styles.regularInter16(CustomColors.black),
                ),
                leading: SvgPicture.asset(Assets.logout),
                onTap: () {
                  Get.offAllNamed(NamedRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
