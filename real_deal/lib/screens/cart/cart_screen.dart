import 'package:flutter/material.dart';

import '../../values/category_list.dart';
import '../../widgets/default_appbar.dart';
import '../../values/custom_colors.dart';
import '../../values/strings.dart';
import '../../values/styles.dart';
import 'widgets/add_more_item_btn.dart';
import 'widgets/bottom_checkout_row.dart';
import 'widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const BottomCheckOut(),
      appBar: customAppBar(
        leading: false,
        title: Text(
          Strings.cart,
          style: Styles.regularInter20(
            CustomColors.normalTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          // SizedBox(height: Get.height * .7),
          Flexible(
            // fit: FlexFit.loose,
            // flex: 2,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: category.length,
              itemBuilder: (_, index) => CartCard(index: index),
            ),
          ),
          const AddMoreItemBtn(),
          // Spacer(),
          // const BottomCheckOut(),
          const SizedBox(height: 80)
        ],
      ),
    );
  }
}
