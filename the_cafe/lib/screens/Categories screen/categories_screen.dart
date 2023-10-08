import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/screens/Categories%20screen/widgets/category_items.dart';
import 'package:the_cafe/screens/Categories%20screen/widgets/main_bar.dart';
import 'package:the_cafe/screens/Categories%20screen/widgets/saerch_bar.dart';
import 'package:the_cafe/screens/Categories%20screen/widgets/title_bar.dart';
import 'package:the_cafe/screens/Favorites%20Screen/favorites_screen.dart';
import 'package:the_cafe/screens/Inbox%20Screen/inbox_screen.dart';
import 'package:the_cafe/screens/Profile%20Screen/profile_screen.dart';
import 'package:the_cafe/size_config.dart';
import 'package:the_cafe/widgets/item_list_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  static String routeName = '/category';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedIndex = 0;
  List<String> categoryListItem = [
    'All',
    'Cafe',
    'Co-Space',
    'Private',
    'Hot-Desk',
  ];

  List<String> screens = [
    CategoriesScreen.routeName,
    FavoritesScreen.routeName,
    InboxScreen.routeName,
    ProfileScreen.routeName
  ];

  List<Icon> icons = [
    const Icon(Icons.all_inbox),
    const Icon(Icons.local_cafe_outlined),
    const Icon(Icons.content_paste_search_outlined),
    const Icon(Icons.privacy_tip_outlined),
    const Icon(Icons.hot_tub_rounded)
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            child: Column(
              children: [
                const MainBar(),
                const SearchBarWidget(),
                const TitleBar(),
                Container(
                  height: 40,
                  child: CategoryItems(
                      icons: icons, categoryListItem: categoryListItem),
                ),
                const ItemListData(),
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: primaryColor,
        //fixedColor: primaryColor,
        items: [
          const BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Saved',
          ),
          const BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: Icon(Icons.inbox_outlined),
            label: 'Inbox',
          ),
          const BottomNavigationBarItem(
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
