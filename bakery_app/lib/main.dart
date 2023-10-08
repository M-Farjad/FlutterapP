import 'package:bakery_app/screens/home_screen.dart';
import 'package:bakery_app/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  return runApp(
    ProviderScope(
      child: const BakeryApp(),
    ),
  );
}

class BakeryApp extends StatelessWidget {
  const BakeryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
