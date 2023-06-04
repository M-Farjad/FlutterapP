import 'package:cosmetics/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_string.dart';
import '../controllers/product_controller.dart';

class ProductListView extends StatelessWidget {
  ProductListView({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.productList),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              final product = productController.productList[index];
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: product.imageLink != null
                              ? Image.network(
                                  product.imageLink!,
                                  width: 150,
                                  height: 100,
                                  fit: BoxFit.fill,
                                  color: AppColor.purpleColor,
                                  colorBlendMode: BlendMode.color,
                                )
                              : Container(), // Replace null with an empty container
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              product.name ?? '',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              product.brand ?? '',
                              style:
                                  TextStyle(fontSize: 14, color: AppColor.grey),
                            ),
                            Text(
                              product.category ?? '',
                              style:
                                  TextStyle(fontSize: 10, color: AppColor.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 2,
                    color: AppColor.grey200,
                  )
                ],
              );
            },
          );
        }
      }),
    );
  }
}
