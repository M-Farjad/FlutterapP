import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Spacing {
  Spacing._();
  static SizedBox vertical(double height) {
    return SizedBox(height: Get.height * height);
  }

  static SizedBox horizontal(double width) {
    return SizedBox(width: Get.width * width);
  }
}
