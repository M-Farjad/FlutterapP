import 'package:flutter/material.dart';

import '../../../controllers/cart_controller.dart';
import '../../../models/product_model.dart';
import '../../../values/custom_colors.dart';
import '../../../values/shadows.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.index,
    required this.controller,
    required this.product,
    required this.quantity,
  });

  final int index;
  final CartController controller;
  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Stack(
        children: [
          SizedBox(
            height: 113,
            child: Card(
              color: CustomColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.asset(
                        product.imagePath,
                        height: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Styles.regularInter13(
                            CustomColors.normalTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          Strings.vegetables,
                          style: Styles.regularInter11(
                            CustomColors.black,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.32,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 69,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            shadows: CustomShadows.shadows,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => controller.removeProducts(product),
                                child: Icon(Icons.remove,
                                    color: CustomColors.primaryColor),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.25,
                                        color: CustomColors.primaryColor),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '$quantity',
                                    style: Styles.regularInter11(
                                      CustomColors.black,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () => controller.addProducts(product),
                                  child: Icon(Icons.add,
                                      color: CustomColors.primaryColor)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                controller.removeWholeProduct(product);
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: CustomColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.remove_outlined,
                    size: 18,
                    color: CustomColors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
