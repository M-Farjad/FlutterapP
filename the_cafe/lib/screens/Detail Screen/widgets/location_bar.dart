import 'package:flutter/material.dart';
import 'package:the_cafe/size_config.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      child: Row(
        children: [
          Image.asset(
            'assets/Group 9.png',
            color: Colors.black,
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Flexible(
            child: Text('Shop no#1, AI-Saif Plaza, Islamabad, Pakistan'),
          ),
        ],
      ),
    );
  }
}
