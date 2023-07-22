import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/values/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/routes.dart';
import 'values/custom_theme.dart';
import 'values/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => SharedPreferences.getInstance());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme,
      getPages: Routes.routeList,
      initialRoute: NamedRoutes.splash,
    );
  }
}
