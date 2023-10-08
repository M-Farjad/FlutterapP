import 'package:bakery_app/Model/bakeryItem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<List<BakeryItem>> {
  FavoriteNotifier() : super([]);

  void updateFavorite(BakeryItem item) {
    var check = state.contains(item);

    if (check) {
      state = state.where((element) => element.name != item.name).toList();
      //state = [...state, item];
    } else {
      state = [...state, item];
    }
  }
}

final FavoriteItemProvider =
    StateNotifierProvider<FavoriteNotifier, List<BakeryItem>>(
        (ref) => FavoriteNotifier());
