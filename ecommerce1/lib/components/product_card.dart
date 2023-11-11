import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../models/product.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
    required this.press,

    // required this.img,
    // required this.title,
    // required this.price,
  }) : super(key: key);
  // final String img, title;
  // final double price;
  final double width, aspectRatio;
  final Product product;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(product.images[0]),
                ),
              ),
              Text(
                product.title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getProportionateScreenWidth(18),
                        color: kPrimaryColor),
                  ),
                  InkWell(
                    onTap: () {},
                    // radius: 40,
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(6)),
                        width: getProportionateScreenWidth(38),
                        height: getProportionateScreenHeight(38),
                        decoration: BoxDecoration(
                            color: product.isFavourite
                                ? kPrimaryColor.withOpacity(0.1)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          'assets/icons/Heart Icon_2.svg',
                          color: product.isFavourite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
