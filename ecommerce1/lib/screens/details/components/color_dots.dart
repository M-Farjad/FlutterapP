import 'package:flutter/material.dart';

import '../../../components/roun_icn_btn.dart';
import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  int selected = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            product.colors.length,
            (index) => ColorDot(
              press: () {},
              color: product.colors[index],
              isSelected: selected == index,
            ),
          ),
          Spacer(),
          RoundIconBtn(
            icnData: Icons.remove,
            press: () {},
          ),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          RoundIconBtn(
            icnData: Icons.add,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.color,
    this.isSelected = false,
    required this.press,
  });

  final Color color;
  final bool isSelected;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(2)),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: product.colors[0],
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent),
        ),
        child: DecoratedBox(
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      ),
    );
  }
}
