import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

import '../../widget/toggle_button.dart';
import '../home_page/home_page.dart';
import '../orders/components/order_card.dart';
import '../orders/orders_screen.dart';
import 'components/custom_stepper.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'My Cart'),
      bottomNavigationBar: CustomBottomNabBar(),
      body: Column(
        children: [
          const CustomStepper(
            stepTitle: [
              ['Cart', true],
              ['Confirmation', false],
              ['Checkout', false]
            ],
          ),
          SizedBox(height: mq.height * .01),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => OrderCard(
                show: true,
              ),
              itemCount: 4,
            ),
          ),
          // Spacer(),
          Container(
            // width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            height: 70,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              shadows: shadowsAbove,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleButton(),
                SizedBox(
                  width: mq.width * .21,
                  child: Text(
                    'All Items',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF555454),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      // height: 20.80,
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Button(
                    label: 'Proceed',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),
        ],
      ),
    );
  }
}
