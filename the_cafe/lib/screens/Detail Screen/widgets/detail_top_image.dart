import 'package:flutter/material.dart';
import 'package:the_cafe/size_config.dart';

class DetailTopImage extends StatelessWidget {
  const DetailTopImage({super.key, required this.ImageURL});

  final String ImageURL;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          height: getProportionateScreenHeight(200),
          width: SizeConfig.screenWidth,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(18),
          // ),
          child: Stack(
            children: [
              Positioned(
                top: -18,
                child: Image.asset(
                  ImageURL,
                  height: getProportionateScreenHeight(200),
                  width: SizeConfig.screenWidth,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(14)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset('assets/Group 16-1.png')),
                        Spacer(),
                        Image.asset(
                          'assets/Group 14.png',
                          //color: Colors.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenWidth(14),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          Image.asset('assets/Group 18.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
