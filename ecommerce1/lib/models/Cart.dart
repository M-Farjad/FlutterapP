import 'package:flutter/material.dart';

import 'product.dart';

class Cart {
  final int numItems;
  final Product product;

  Cart({required this.numItems, required this.product});
}

List<Cart> demoCarts = [
  Cart(numItems: 2, product: demoProducts[0]),
  Cart(numItems: 3, product: demoProducts[1]),
  Cart(numItems: 1, product: demoProducts[2])
];
