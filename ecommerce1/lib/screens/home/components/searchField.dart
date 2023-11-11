import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Container(
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        width: SizeConfig.screenWidth * 0.6,
        height: 50,
        child: TextField(
          onChanged: (value) {
            //Search Value
          },
          decoration: const InputDecoration(
              // contentPadding: EdgeInsets.symmetric(
              //     horizontal: getProportionateScreenWidth(50),
              //     vertical: getProportionateScreenHeight(15)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search ...",
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
