import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/screens/Profile%20Screen/widgets/profile_options.dart';
import 'package:the_cafe/screens/Profile%20Screen/widgets/profile_person.dart';
import 'package:the_cafe/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Profile      ',
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.w600, fontSize: 24),
          ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/Group 16.png')),
        actions: [],
      ),
      body: Column(
        children: [
          ProfilePerson(),
          profileOptions(
            ImageURL: 'assets/Vector-12.png',
            text: 'Bookings',
          ),
          profileOptions(
            ImageURL: 'assets/Group-2.png',
            text: 'Payment History',
          ),
          profileOptions(
            ImageURL: 'assets/Vector-13.png',
            text: 'Settings',
          ),
          profileOptions(
            ImageURL: 'assets/Group-3.png',
            text: 'Logout',
          ),
        ],
      ),
    );
  }
}
