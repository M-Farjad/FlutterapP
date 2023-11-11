import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/home/components/section_title.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/product_card.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'homeHeader.dart';
import 'popular_products.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(20)),
            discountBanner(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenHeight(20)),
            PopularProducts(),
          ],
        ),
      ),
    );
  }
}
