import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

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
      // body: Stepper(
      //   currentStep: currentStep,
      //   steps: getSteps(),
      //   type: StepperType.horizontal,
      // ),
      body: Column(
        children: [
          const CustomStepper(
            stepTitle: [
              ['Cart', true],
              ['Confirmation', false],
              ['Checkout', false]
            ],
          ),
          ListView.builder(
            itemBuilder: (context, index) => Expanded(
              child: OrderCard(
                show: true,
              ),
            ),
            itemCount: 2,
          )
        ],
      ),
    );
  }
}
