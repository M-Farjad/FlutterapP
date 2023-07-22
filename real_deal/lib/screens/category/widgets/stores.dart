import 'package:flutter/material.dart';

import '../../../values/custom_colors.dart';

class ShowStores extends StatelessWidget {
  const ShowStores({
    super.key,
    required this.stores,
  });

  final List<String> stores;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: CustomColors.primaryColor),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stores.length,
            itemBuilder: (_, index) => SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.asset(
                  stores[index],
                ),
              ),
            ),
          ),
        ),
        Divider(color: CustomColors.primaryColor),
      ],
    );
  }
}
