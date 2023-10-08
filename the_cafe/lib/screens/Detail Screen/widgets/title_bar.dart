import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/size_config.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getProportionateScreenWidth(12),
        left: getProportionateScreenWidth(12),
        right: getProportionateScreenWidth(12),
      ),
      child: Row(
        children: [
          Text(
            'THE CAFE',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: getProportionateScreenWidth(45),
            ),
          ),
          Spacer(),
          Text(
            '\$500',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w700,
                fontSize: getProportionateScreenWidth(30)),
          ),
        ],
      ),
    );
  }
}
