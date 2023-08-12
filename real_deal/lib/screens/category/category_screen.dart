import 'package:flutter/material.dart';
import 'package:real_deal/screens/category/widgets/catalog_products.dart';

import '../../values/assets.dart';
import '../../values/category_list.dart';
import '../../values/custom_colors.dart';
import '../../values/strings.dart';
import '../../widgets/search_field.dart';
import '../home/widgets/category.dart';
import 'widgets/stores.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, this.showStore = false});
  final List<String> stores = [
    Assets.metro,
    Assets.rahimStore,
    Assets.rahimStore,
    Assets.cashCarry
  ];
  bool? showStore;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: SearchField(color: CustomColors.fieldFillColor),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 110,
              child: Row(
                children: [
                  //!show Store row
                  showStore == true
                      ? CategoryWidget(
                          title: Strings.all,
                          image: Assets.items,
                          showAll: true,
                        )
                      : const SizedBox(),
                  Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      itemCount: category.length,
                      itemBuilder: (_, int index) {
                        return CategoryWidget(
                          title: category[index].title,
                          image: category[index].imagePath,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            showStore == true ? ShowStores(stores: stores) : const SizedBox(),
            const CatalogProductsGrid(),
          ],
        ),
      ),
    );
  }
}
