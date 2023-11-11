import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  GenderCard({@required this.category, @required this.icon});
  late String? category;
  late IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(category!, style: kLightTextStyle),
      ],
    );
  }
}
