import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/product.dart';

class FavouriteController extends GetxController {
  final carts = <Product>{}.obs;

  void addTofavourite({required Product product}) {
    this.carts.value.add(product);
  }

  void removeTofavourite({required Product product}) {
    this.carts.value.remove(product);
  }

  bool checkfavourite({required Product product}) {
    return carts.value.where((element) => element == product).isNotEmpty;
  }
}
