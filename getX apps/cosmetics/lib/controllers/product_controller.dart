import 'package:get/get.dart';

import '../api/api_service.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  RxList<ProductModel> productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await API.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
