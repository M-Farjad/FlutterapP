import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../widget/text_appbar.dart';
import '../../constants/constant.dart';
import '../orders/orders_screen.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const TextAppBar(title: 'Order Details'),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .2),
        child: Center(
          child: Column(
            children: [
              Text('Order Status', style: constant.kTextStyle),
              StepProgressIndicator(
                totalSteps: 3,
                currentStep: 1,
                size: 8,
                roundedEdges: Radius.circular(20),
                selectedColor: Color(constant.red),
                unselectedColor: Colors.grey,
              )
            ],
          ),
        ),
      )),
    );
  }
}
