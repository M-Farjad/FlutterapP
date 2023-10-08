import 'package:flutter/material.dart';
import 'package:the_cafe/routes.dart';
import 'package:the_cafe/screens/home%20screen/homescreen.dart';
import 'package:the_cafe/theme.dart';

void main() {
  runApp(const CafeApp());
}

class CafeApp extends StatelessWidget {
  const CafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
