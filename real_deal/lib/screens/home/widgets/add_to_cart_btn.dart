import 'package:flutter/material.dart';

import '../../../values/custom_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 5,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 28,
          height: 28,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.75, color: CustomColors.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Icon(
            Icons.add,
            color: CustomColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
