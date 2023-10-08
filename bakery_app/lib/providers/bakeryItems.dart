import 'package:bakery_app/dummyData/ItemsData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemsProvider = Provider((ref) => dummyItems);
