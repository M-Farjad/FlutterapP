import 'package:deep_linking/cart_screen.dart';
import 'package:flutter/material.dart';
// import 'package:uni_links/uni_links.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';

import 'home_screen.dart';
import 'profile_screen.dart';

// Future<void> initPlatformState() async {
//   // Ensure deep linking is set up correctly
//   await initUniLinks();
// }

// // Handle deep link data
// Future<void> initUniLinks() async {
//   final initialLink = await getInitialLink();
//   handleDeepLink(initialLink as Uri?);
//   // Listen for incoming deep links
//   getUriLinksStream().listen((Uri? uri) {
//     handleDeepLink(uri);
//   });
// }

// void handleDeepLink(Uri? uri) {
//   if (uri != null) {
//     // Parse the URI and extract necessary information (e.g., the profile parameter)
//     // You can then navigate to the ProfileScreen with the extracted profile parameter.
//     final profile = uri.pathSegments.last;
//     Get.to(ProfileScreen(), arguments: {'profile': profile});
//   }
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  // Initialize deep linking
  // initPlatformState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/cart', page: () => const CartScreen()),
        GetPage(name: '/p/:id', page: () => ProfileScreen()),
        // GetPage(name: '/product/:id/:shop', page: () => ProfileScreen()),
      ],
    );
  }
}
