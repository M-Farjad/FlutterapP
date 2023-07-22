import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../values/custom_colors.dart';

class ItemLikeButton extends StatelessWidget {
  const ItemLikeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 5,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(3),
          width: 31,
          height: 31,
          decoration: ShapeDecoration(
            color: CustomColors.black.withOpacity(0.5600000023841858),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.69),
            ),
          ),
          child: SvgPicture.asset(
            'assets/icons/heart.svg',
            color: CustomColors.white,
          ),
        ),
      ),
    );
  }
}
