import 'package:flutter/material.dart';
import 'package:the_cafe/size_config.dart';

class InboxImage extends StatelessWidget {
  const InboxImage({
    super.key,
    required this.ImageURL,
  });

  final String ImageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(50),
      height: getProportionateScreenHeight(50),
      child: Stack(
        children: [
          Image.asset(
            ImageURL,
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              height: getProportionateScreenHeight(10),
              width: getProportionateScreenWidth(10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 114, 226, 100),
                  shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
