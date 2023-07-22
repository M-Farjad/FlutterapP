import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/image_controller.dart';
import '../../../models/category_model.dart';
import '../../../values/custom_colors.dart';

class DealIndicators extends StatelessWidget {
  const DealIndicators({
    super.key,
    required this.category,
    required this.imageController,
  });

  final List<CategoryModel> category;
  final ImageController imageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
      height: 8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Obx(
              () {
                bool isCurrentImage =
                    index == imageController.currentImageIndex.value;
                double indicatorWidth = isCurrentImage ? 29.0 : 8.0;
                return Container(
                  width: indicatorWidth,
                  height: 8,
                  decoration: ShapeDecoration(
                    color: isCurrentImage
                        ? CustomColors.primaryColor
                        : CustomColors.lightGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
