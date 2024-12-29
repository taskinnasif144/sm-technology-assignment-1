

import 'package:get/get.dart';

class CarouselIndexController extends GetxController {
  var currentCarouselIndex = 0.obs;
  setCurrentCarouselIndex(int index) => currentCarouselIndex.value = index;
}