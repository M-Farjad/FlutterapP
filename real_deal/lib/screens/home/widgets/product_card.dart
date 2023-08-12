import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../../models/product_model.dart';
import '../../../values/custom_colors.dart';
import '../../../values/shadows.dart';
import '../../../values/styles.dart';
import 'add_to_cart_btn.dart';
import 'iterm_like_btn.dart';

class CatalogProductCard extends StatelessWidget {
  CatalogProductCard({
    super.key,
    required this.index,
  });
  final int index;
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        // width: 157,
        // height: 210,
        width: 157,
        // height: 251,
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
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    ProductModel.products[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          ProductModel.products[index].name,
                          style: Styles.regularInter14(
                            CustomColors.normalTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            ProductModel.products[index].newPrice.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: Styles.regularInter13(
                              CustomColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -.32,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            ProductModel.products[index].sellMethod,
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
                          ProductModel.products[index].oldPrice.toString(),
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
            AddToCartButton(
              onTap: () => controller.addProducts(
                ProductModel.products[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
