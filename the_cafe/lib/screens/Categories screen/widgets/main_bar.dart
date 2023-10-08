import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/size_config.dart';
import 'package:the_cafe/widgets/notification_bell.dart';

class MainBar extends StatelessWidget {
  const MainBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: getProportionateScreenWidth(10),
            bottom: getProportionateScreenWidth(10),
          ),
          child: Container(
            child: Image.asset('assets/Ellipse 1.png'),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Muzammil Iftikhar',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              Text(
                'Hi where you have to go?',
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ),
        Spacer(),
        notificationBell(),
      ],
    );
  }
}
