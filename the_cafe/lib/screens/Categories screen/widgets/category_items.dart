import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/size_config.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
    required this.icons,
    required this.categoryListItem,
  });

  final List<Icon> icons;
  final List<String> categoryListItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: icons.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(5),
                horizontal: getProportionateScreenHeight(6)),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: smalltextColor, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Row(
                  children: [
                    icons[index],
                    Text(
                      categoryListItem[index],
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
