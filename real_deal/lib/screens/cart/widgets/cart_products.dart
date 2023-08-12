import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import 'cart_card.dart';

class CartProducts extends StatelessWidget {
  CartProducts({
    super.key,
  });
  final CartController controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        // fit: FlexFit.loose,
        // flex: 2,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.products.length,
          itemBuilder: (context, index) => CartCard(
            index: index,
            controller: controller,
            product: controller.products.keys.toList()[index],
            quantity: controller.products.values.toList()[index],
          ),
        ),
      ),
    );
  }
}
