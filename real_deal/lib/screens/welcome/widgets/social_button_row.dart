import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButtonRow extends StatelessWidget {
  const SocialButtonRow({
    super.key,
    required this.assetName,
    required this.text,
    required this.color,
  });
  final String assetName;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: SvgPicture.asset(assetName),
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 18),
      ],
    );
  }
}
