import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/details/components/body.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final DetailsProductArguements agrs =
        ModalRoute.of(context)!.settings.arguments as DetailsProductArguements;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: Body(
        product: agrs.product,
      ),
    );
  }
}

class DetailsProductArguements {
  final Product product;

  DetailsProductArguements({required this.product});
}
