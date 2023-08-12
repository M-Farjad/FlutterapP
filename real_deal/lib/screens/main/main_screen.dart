import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_deal/screens/cart/cart_screen.dart';

import '../../controllers/main_controller.dart';
import '../category/category_screen.dart';
import '../home/home_screen.dart';
import '../profile_screen.dart';
import 'widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenController controller = Get.put(MainScreenController());
  // final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    // _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ;
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          //!All the screens will go in here
          HomeScreen(),
          Container(), // Contents of the second page
          const CartScreen(), // Contents of the Third page
          CategoryScreen(showStore: true), // Contents of the fourth page
          ProfileScreen(), // Contents of the fifth page
          // Add containers for the remaining pages as needed
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        controller: controller,
        // pageController: controller.pageController,
      ),
    );
  }
}
