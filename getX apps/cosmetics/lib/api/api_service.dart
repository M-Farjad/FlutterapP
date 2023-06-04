import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class API {
  static var client = http.Client();

  static Future<List<ProductModel>> fetchProducts() async {
    var res = await client.get(
      Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'),
    );
    if (res.statusCode == 200) {
      var jsonString = res.body;
      return productListFromJson(jsonString);
    }
    return []; // Return an empty list if there is an error
  }
}
