import 'package:bakery_app/Model/bakeryItem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  CartNotifier() : super([]);

  void updateCart(int val, BakeryItem item) {
    var check = false;
    for (var element in state) {
      if (element.containsValue(item)) {
        check = true;
      } else {}
    }
    if (check) {
      state = state.where((element) => element.values != item).toList();
    } else {
      state = [
        ...state,
        {'quantity': val, 'item': item}
      ];
    }
  }
}

final CartItemProvider =
    StateNotifierProvider<CartNotifier, List<Map<String, dynamic>>>(
        (ref) => CartNotifier());
