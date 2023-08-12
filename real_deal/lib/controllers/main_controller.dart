import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
    _pageController.jumpToPage(index);
    update();
  }

  // void navigateToPage(int pageIndex) {
  //   _pageController.jumpToPage(pageIndex);
  //   update();
  // }
}
