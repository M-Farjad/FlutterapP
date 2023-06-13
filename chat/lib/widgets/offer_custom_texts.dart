import 'package:flutter/material.dart';

import '../constants/constants.dart';

class OfferNCustomTexts extends StatelessWidget {
  const OfferNCustomTexts({
    super.key,
    required this.title,
    required this.package,
  });
  final String title;
  final String package;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: kTextColor,
            ),
          ),
          Text(
            package,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
