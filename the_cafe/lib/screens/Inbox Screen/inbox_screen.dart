import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/screens/Categories%20screen/categories_screen.dart';
import 'package:the_cafe/screens/Favorites%20Screen/favorites_screen.dart';
import 'package:the_cafe/screens/Inbox%20Screen/widgets/contact_message.dart';
import 'package:the_cafe/screens/Profile%20Screen/profile_screen.dart';
import 'package:the_cafe/size_config.dart';
import 'package:the_cafe/widgets/notification_bell.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  static String routeName = '/inbox';

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    List<String> screens = [
      CategoriesScreen.routeName,
      FavoritesScreen.routeName,
      InboxScreen.routeName,
      ProfileScreen.routeName
    ];
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Inbox',
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.w600, fontSize: 24),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/Group 16.png'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            child: notificationBell(),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            ContactMessage(
                name: 'Mr. John',
                message: 'Thank you for your time. Can I call you?',
                icon: Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.black,
                ),
                ImageURL: 'assets/Ellipse 5.png'),
            ContactMessage(
                name: 'Ms. Anna',
                message: 'Thank you for your time.',
                icon: Icon(
                  Icons.done_all,
                  size: 20,
                  color: Colors.blue,
                ),
                ImageURL: 'assets/Ellipse 7.png'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: primaryColor,
        //fixedColor: primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: Icon(Icons.inbox_outlined),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pushNamed(context, screens[_selectedIndex]);
        },
      ),
    );
  }
}
