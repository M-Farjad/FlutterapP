import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../home/widgets/product_card.dart';

class CatalogProductsGrid extends StatelessWidget {
  const CatalogProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .7),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: ProductModel.products.length,
        itemBuilder: (context, index) => CatalogProductCard(index: index),
      ),
    );
  }
}

class CatalogProductsList extends StatelessWidget {
  const CatalogProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .28,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: ProductModel.products.length,
        itemBuilder: (context, index) => CatalogProductCard(index: index),
      ),
    );
  }
}
