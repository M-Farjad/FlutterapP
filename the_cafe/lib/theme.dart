import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appbartheme(),
    textTheme: textTheme(),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // Customize the BottomNavigationBar
      backgroundColor:
          primaryColor, // Background color of the BottomNavigationBar
      selectedItemColor: Colors.white, // Color of selected item's icon and text
      unselectedItemColor:
          Colors.white, // Color of unselected items' icons and text
    ),
  );
}

AppBarTheme appbartheme() {
  return AppBarTheme(
    backgroundColor: primaryColor,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: primaryColor,
    ),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: primaryColor),
    bodyMedium: TextStyle(color: Colors.black),
  );
}
