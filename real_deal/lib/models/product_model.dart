import '../values/assets.dart';
import '../values/strings.dart';

class ProductModel {
  final String imagePath, name, sellMethod;
  final int oldPrice, newPrice;

  ProductModel({
    required this.imagePath,
    required this.name,
    required this.sellMethod,
    required this.oldPrice,
    required this.newPrice,
  });

  static List<ProductModel> products = [
    ProductModel(
      imagePath: Assets.carrots,
      name: Strings.carrots,
      sellMethod: Strings.perKG,
      oldPrice: 210,
      newPrice: 190,
    ),
    ProductModel(
      imagePath: Assets.redChili,
      name: Strings.redChili,
      sellMethod: Strings.perKG,
      oldPrice: 160,
      newPrice: 140,
    ),
    ProductModel(
      imagePath: Assets.onions,
      name: Strings.onions,
      sellMethod: Strings.perKG,
      oldPrice: 230,
      newPrice: 200,
    ),
    ProductModel(
      imagePath: Assets.potatoes,
      name: Strings.potatoes,
      sellMethod: Strings.perKG,
      oldPrice: 120,
      newPrice: 90,
    ),
  ];
}
