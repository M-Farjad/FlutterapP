import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class CustomAmountButton extends StatelessWidget {
  final String amount;
  final int index;

  final RxInt selectedButtonIndex;
  final void Function(String, int) onPressed; // Updated type

  const CustomAmountButton({
    Key? key,
    required this.amount,
    required this.index,
    required this.selectedButtonIndex,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPressed(amount, index),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: selectedButtonIndex == index
                  ? Colors.transparent
                  : kofferColor,
            ),
          ),
          backgroundColor:
              selectedButtonIndex == index ? kofferColor : Colors.white,
        ),
        child: Text(
          amount,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: selectedButtonIndex == index ? Colors.white : kofferColor,
          ),
        ),
      ),
    );
  }
}
