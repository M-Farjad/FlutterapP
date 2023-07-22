import 'package:flutter/material.dart';

import '../../../values/custom_colors.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';

class AddMoreItemBtn extends StatelessWidget {
  const AddMoreItemBtn({
    super.key,
  });
  // final pageController = Get.find<PageController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 5),
          child: InkWell(
            onTap: () {
              // pageController.animateToPage(3,
              //     duration: const Duration(seconds: 1),
              //     curve: Curves.bounceInOut);
            },
            borderRadius: BorderRadius.circular(10),
            child: Ink(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side:
                      BorderSide(width: 0.50, color: CustomColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  Strings.addMoreItemsToCart,
                  style: Styles.regularInter16(
                    CustomColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
