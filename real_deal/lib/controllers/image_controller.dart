import 'package:get/get.dart';

class ImageController extends GetxController {
  RxInt currentImageIndex = 0.obs;

  void updateImageIndex(int index) {
    currentImageIndex.value = index;
  }
}
