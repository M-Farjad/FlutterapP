import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomTheme {
  CustomTheme._();
  static ThemeData? theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
    useMaterial3: true,
  );
}
