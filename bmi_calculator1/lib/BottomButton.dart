import 'package:flutter/material.dart';
import 'Constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.ontap, required this.ButtonTitle});
  Function ontap;
  String ButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        ontap;
      }),
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: kbottomcolor,
        ),
        margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            ButtonTitle,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
