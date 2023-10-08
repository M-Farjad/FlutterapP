import 'package:flutter/material.dart';
import 'package:the_cafe/size_config.dart';

class profileOptions extends StatelessWidget {
  const profileOptions({
    super.key,
    required this.ImageURL,
    required this.text,
  });

  final String ImageURL;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(30),
        left: getProportionateScreenWidth(30),
        right: getProportionateScreenWidth(30),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(40, 0, 0, 0),
              ),
              child: Image.asset(
                ImageURL,
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenHeight(50),
              )),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
