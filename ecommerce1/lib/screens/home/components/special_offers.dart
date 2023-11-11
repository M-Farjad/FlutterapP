import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'special_offer_card.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        SectionTitle(press: () {}, text: 'Special for you'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                img: 'assets/images/Image Banner 2.png',
                category: 'Smartphone',
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                img: 'assets/images/Image Banner 3.png',
                category: 'Fashions',
                numOfBrands: 24,
                press: () {},
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
