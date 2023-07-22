import 'package:flutter/material.dart';

import '../../values/assets.dart';
import '../../values/category_list.dart';
import '../../values/custom_colors.dart';
import '../../values/strings.dart';
import '../../widgets/search_field.dart';
import '../home/widgets/category.dart';
import '../home/widgets/product_card.dart';
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
              height: 100,
              child: Row(
                children: [
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
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: .7),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: category.length,
                itemBuilder: (_, index) => const ProductCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
