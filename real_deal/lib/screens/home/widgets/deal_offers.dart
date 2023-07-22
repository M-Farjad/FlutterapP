import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/image_controller.dart';
import '../../../models/category_model.dart';
import '../../../values/custom_colors.dart';
import '../../../values/shadows.dart';

class DealOffers extends StatelessWidget {
  const DealOffers({
    super.key,
    required PageController pageController,
    required this.category,
    required this.imageController,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<CategoryModel> category;
  final ImageController imageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: Get.width,
              // height: 163,
              child: PageView.builder(
                // padEnds: false,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 5,
                      right: 5,
                    ),
                    child: Container(
                      width: 307,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0.00, -1.00),
                          end: const Alignment(0, 1),
                          colors: [
                            CustomColors.primaryColor,
                            CustomColors.darkPrimaryColor,
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        shadows: CustomShadows.shadowsAbove,
                      ),
                      child: ClipRRect(
                        child: Image.asset(
                          'assets/images/offer.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                onPageChanged: (int index) {
                  imageController.updateImageIndex(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
