import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/screens/Categories%20screen/categories_screen.dart';
import 'package:the_cafe/screens/Inbox%20Screen/inbox_screen.dart';
import 'package:the_cafe/screens/Profile%20Screen/profile_screen.dart';
import 'package:the_cafe/size_config.dart';
import 'package:the_cafe/widgets/item_list_data.dart';
import 'package:the_cafe/widgets/notification_bell.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  static String routeName = '/favorites';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedIndex = 0;
  List<String> screens = [
    CategoriesScreen.routeName,
    FavoritesScreen.routeName,
    InboxScreen.routeName,
    ProfileScreen.routeName
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'My Favorite Space',
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
      body: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          ItemListData()
        ],
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
