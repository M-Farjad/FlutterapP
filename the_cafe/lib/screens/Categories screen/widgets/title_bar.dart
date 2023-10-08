import 'package:flutter/material.dart';
import 'package:the_cafe/size_config.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: Row(
        children: [
          Text(
            ' Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          Image.asset('assets/Vector-9.png'),
        ],
      ),
    );
  }
}
