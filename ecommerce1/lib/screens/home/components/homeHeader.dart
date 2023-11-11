import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'iconBtnCounter.dart';
import 'searchField.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnCounter(
              svgSrc: "assets/icons/Bell.svg", press: () {}, numOfItems: 3),
        ],
      ),
    );
  }
}
