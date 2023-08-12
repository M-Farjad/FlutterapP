import 'dart:developer';

import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  var _products = {}.obs;
  RxMap<dynamic, dynamic> get products => _products;

  void addProducts(ProductModel product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    update();
    // log(product.name);
    Get.snackbar(
      'Added Product',
      '${product.name} is added',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeWholeProduct(ProductModel product) {
    if (_products.containsKey(product)) {
      _products.removeWhere((key, value) => key == product);
      Get.snackbar(
        'Removed Product',
        '${product.name} is added',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      log('${product.name} does not exist');
    }
    update();
  }

  void removeProducts(ProductModel product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
    update();
    // log(product.name);
    Get.snackbar(
      'Removed Product',
      '${product.name} is added',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
