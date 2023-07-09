import 'package:eventually_user/models/onboardpage_model.dart';
import 'package:eventually_user/screens/cart/components/custom_stepper.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/screens/orders/components/order_card.dart';
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import '../orders/orders_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen({super.key});
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Confirmation'),
      bottomNavigationBar: CustomBottomNabBar(),
      body: SafeArea(
          child: Column(
        children: [
          const CustomStepper(
            stepTitle: [
              ['Cart', false],
              ['Confirmation', true],
              ['Checkout', false]
            ],
          ),
          SizedBox(height: mq.height * .25, child: OrderCard()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .06, vertical: mq.width * .06),
              width: double.infinity,
              // height: mq.height * .4,
              decoration: ShapeDecoration(
                shadows: shadowsAbove,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Form(
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: mq.height * .02),
                    const ConfirmationTextFieldRow(title: 'First Name:'),
                    SizedBox(height: mq.height * .02),
                    const ConfirmationTextFieldRow(title: 'Last Name:'),
                    SizedBox(height: mq.height * .02),
                    const ConfirmationTextFieldRow(title: 'Phone No:'),
                    SizedBox(height: mq.height * .02),
                    const ConfirmationTextFieldRow(title: 'Address:'),
                    SizedBox(height: mq.height * .02),
                    const ConfirmationTextFieldRow(title: 'Date & Time:')
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: mq.height * .03),
          Button(
              label: 'Confirm',
              onPressed: () {
                // if(_formKey.currentState.validate)
              })
        ],
      )),
    );
  }
}

class ConfirmationTextFieldRow extends StatelessWidget {
  const ConfirmationTextFieldRow({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: mq.width * .15,
          child: Text(
            title,
            style: k8TextStyle,
          ),
        ),
        Expanded(
          child: SizedBox(
            // width: mq.width * .6,
            height: 34,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your $title';
                }
                return null;
              },
              style: k8TextStyle,
              decoration: InputDecoration(
                labelStyle: k8TextStyle,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.40, color: Color(constant.red)),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.40,
                    color: Color(constant.red),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: title,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
