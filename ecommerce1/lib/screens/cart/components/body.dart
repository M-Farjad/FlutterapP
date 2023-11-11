import 'package:ecommerce/models/Cart.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cart_item_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
          child: Dismissible(
            onDismissed: (direction) => setState(() {
              demoCarts.removeAt(index);
              // demoCarts.reduce((value, element) => demoCarts[index]);
            }),
            direction: DismissDirection.endToStart,
            key: Key(demoCarts[index].product.id.toString()),
            child: CartItemCard(cart: demoCarts[index]),
            background: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset('assets/icons/Trash.svg'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
