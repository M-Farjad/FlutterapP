import 'package:flutter/material.dart';
import 'package:the_cafe/screens/Inbox%20Screen/inbox_screen.dart';
import 'package:the_cafe/size_config.dart';

class notificationBell extends StatelessWidget {
  const notificationBell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, InboxScreen.routeName);
      },
      child: Stack(
        children: [
          Image.asset('assets/Vector-6.png'),
          Positioned(
            left: 2,
            child: Container(
              height: getProportionateScreenHeight(7),
              width: getProportionateScreenWidth(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
