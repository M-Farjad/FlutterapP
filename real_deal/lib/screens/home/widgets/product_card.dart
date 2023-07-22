import 'package:flutter/material.dart';

import '../../../values/assets.dart';
import '../../../values/custom_colors.dart';
import '../../../values/shadows.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import 'add_to_cart_btn.dart';
import 'iterm_like_btn.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        // width: 157,
        // height: 210,
        width: 157,
        height: 251,
        decoration: ShapeDecoration(
          color: CustomColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: CustomShadows.shadowsAll,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.carrots,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          Strings.freshCarrot,
                          style: Styles.regularInter14(
                            CustomColors.normalTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            Strings.newPrice,
                            style: Styles.regularInter13(
                              CustomColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -.32,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            Strings.perKG,
                            style: Styles.regularInter10(
                              CustomColors.lightTextColor,
                              letterSpacing: 0.07,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          Strings.oldPrice,
                          style: Styles.regularInter11(
                            CustomColors.grey,
                            fontWeight: FontWeight.w500,
                            lineThrough: true,
                            letterSpacing: -.32,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const ItemLikeButton(),
            const AddToCartButton()
          ],
        ),
      ),
    );
  }
}
