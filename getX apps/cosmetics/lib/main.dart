import '../constants/app_color.dart';
import 'package:flutter/material.dart';

import 'api/api_service.dart';
import 'constants/app_string.dart';
import 'views/product_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.fetchApiData,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.purpleColor),
        useMaterial3: true,
      ),
      home: ProductListView(),
    );
  }
}
