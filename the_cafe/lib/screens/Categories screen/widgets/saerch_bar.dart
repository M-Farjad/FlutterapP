import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/size_config.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: smalltextColor, width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(15),
            ),
            child: Image.asset('assets/Vector-3.png'),
          ),
          Text(
            'Search Space',
            style: TextStyle(
                color: smalltextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
