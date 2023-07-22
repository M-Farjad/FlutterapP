import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../values/assets.dart';
import '../values/custom_colors.dart';
import '../values/strings.dart';
import '../values/styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: Get.width * .7,
      child: TextFormField(
        style: Styles.regularInter12(
          CustomColors.grey,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(Assets.search),
          ),
          hintText: Strings.searchFieldHint,
          hintStyle: Styles.regularInter12(
            CustomColors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
