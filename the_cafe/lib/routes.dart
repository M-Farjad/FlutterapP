import 'package:flutter/material.dart';
import 'package:the_cafe/screens/Categories%20screen/categories_screen.dart';
import 'package:the_cafe/screens/Favorites%20Screen/favorites_screen.dart';
import 'package:the_cafe/screens/Inbox%20Screen/inbox_screen.dart';
import 'package:the_cafe/screens/Login%20screen/login_screen.dart';
import 'package:the_cafe/screens/Profile%20Screen/profile_screen.dart';
import 'package:the_cafe/screens/Sign%20up%20screen/sign_up_screen.dart';
import 'package:the_cafe/screens/home%20screen/homescreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  //DetailScreen.routeName: (context) => DetailScreen(titleText: '',ImageURL: ''),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  FavoritesScreen.routeName: (context) => FavoritesScreen(),
  InboxScreen.routeName: (context) => InboxScreen(),
};
