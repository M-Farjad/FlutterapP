import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../values/custom_colors.dart';
import '../../../values/shadows.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';

class BottomCheckOut extends StatelessWidget {
  const BottomCheckOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * .51,
                  child: Text(
                    Strings.freeDeliveryText,
                    style: Styles.regularInter10(const Color(0xFF3F3F3F)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    // width: 124,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: CustomColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: CustomShadows.shadowsNotTop,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          Strings.checkout,
                          style: Styles.regularInter16(
                            CustomColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
