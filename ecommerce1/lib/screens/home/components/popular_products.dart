import 'package:ecommerce/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/product_card.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: 'Popular Products', press: () {}),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  product: demoProducts[index],
                  press: () => Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments:
                        DetailsProductArguements(product: demoProducts[index]),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
              // img: demoProduct[0].images[0],
              // title: demoProduct[0].title,
              // price: demoProduct[0].price,
              // press: () {},
            ],
          ),
        ),
      ],
    );
  }
}
