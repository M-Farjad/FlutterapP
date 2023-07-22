import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../values/custom_colors.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../values/values.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.image,
    this.showAll = false,
  });
  final String title;
  final String image;
  final bool? showAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (showAll != true) {
                Get.toNamed(NamedRoutes.category);
              }
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 53,
              height: 53,
              padding: const EdgeInsets.all(6),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: CustomColors.lightPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: showAll == true && title == Strings.all
                        ? BorderSide(color: CustomColors.primaryColor, width: 1)
                        : const BorderSide(color: Colors.transparent)),
              ),
              child: Image.asset(image),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.regularInter12(CustomColors.normalTextColor),
          )
        ],
      ),
    );
  }
}
