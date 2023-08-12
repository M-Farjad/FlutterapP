import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
import '../../../values/assets.dart';
import '../../../values/custom_colors.dart';
import '../../../values/shadows.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.controller,
    // required PageController pageController,
  }) // : _pageController = pageController;
  ;
  final MainScreenController controller;
  // final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: ShapeDecoration(
        color: CustomColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
        ),
        shadows: CustomShadows.shadowsAbove,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              controller.updateSelectedIndex(0);
            },
            child: InkResponse(
              child: Obx(
                () => SvgPicture.asset(
                  controller.selectedIndex.value == 0
                      ? Assets.homeSelected
                      : Assets.home,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.updateSelectedIndex(1);
            },
            child: InkResponse(
              child: Obx(
                () => SvgPicture.asset(
                  controller.selectedIndex.value == 1
                      ? Assets.heartSelected
                      : Assets.heart,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.updateSelectedIndex(2);
            },
            child: InkResponse(
              child: Obx(
                () => SvgPicture.asset(
                  controller.selectedIndex.value == 2
                      ? Assets.cartSelected
                      : Assets.cart,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.updateSelectedIndex(3);
            },
            child: InkResponse(
              child: Obx(
                () => SvgPicture.asset(
                  controller.selectedIndex.value == 3
                      ? Assets.shopSelected
                      : Assets.shop,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.updateSelectedIndex(4);
            },
            child: InkResponse(
              child: Obx(
                () => SvgPicture.asset(
                  controller.selectedIndex.value == 4
                      ? Assets.userSelected
                      : Assets.user,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
