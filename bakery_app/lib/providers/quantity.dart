import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantityNotifier extends StateNotifier<List<int>> {
  QuantityNotifier() : super([]);
  void updateQuantity(int Val) {
    state = [...state, Val];
  }
}

final quantityProvider = StateNotifierProvider<QuantityNotifier, List<int>>(
    (ref) => QuantityNotifier());
