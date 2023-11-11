import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const ProfilePic(),
          SizedBox(height: getProportionateScreenHeight(20)),
          ProfileMenu(
            icon: 'assets/icons/User Icon.svg',
            press: () {},
            text: 'My Account',
          ),
          ProfileMenu(
            icon: 'assets/icons/bell.svg',
            press: () {},
            text: 'Notifications',
          ),
          ProfileMenu(
            icon: 'assets/icons/Settings.svg',
            press: () {},
            text: 'Settings',
          ),
          ProfileMenu(
            icon: 'assets/icons/Question Mark.svg',
            press: () {},
            text: 'Help Centre',
          ),
          ProfileMenu(
            icon: 'assets/icons/Log Out.svg',
            press: () {},
            text: 'Log Out',
          ),
        ],
      ),
    );
  }
}
