import 'package:bakery_app/Model/bakeryItem.dart';
import 'package:bakery_app/dummyData/ItemsData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNotifier extends StateNotifier<List<BakeryItem>> {
  CategoryNotifier() : super(dummyItems);

  void toggleCategoryItems(String id) {
    final catItems = dummyItems.where((element) => element.id == id).toList();
    state = catItems;
  }
}

final CategoryItemsProvider =
    StateNotifierProvider<CategoryNotifier, List<BakeryItem>>(
        (ref) => CategoryNotifier());
