import 'package:bakery_app/providers/bakeryItems.dart';
import 'package:bakery_app/screens/favorites_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/items_list.dart';
import '../widgets/menu_list.dart';
import '../widgets/recommend_list.dart';
import '../widgets/title_bar.dart';
import 'cart_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final items = ref.watch(itemsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' UKKIL Bakery',
          style: TextStyle(
              color: Colors.pink, fontSize: 28, fontWeight: FontWeight.w700),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleBar(),
              MenuList(),
              SizedBox(
                height: height / 20,
              ),
              ItemsList(),
              // SizedBox(
              //   height: 28,
              // ),
              Text(
                '   Recommended',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              RecommendList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeIn,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.pink,
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CartScreen();
                },
              ),
            );
          } else if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FavoriteScreen();
                },
              ),
            );
          }
        },
        height: 50,
        color: Colors.pink,
        items: [
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
