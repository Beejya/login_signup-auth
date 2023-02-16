import 'package:clothywave/Model/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final carts = <Product>{}.obs;

  void addToCart({required Product product}) {
    this.carts.value.add(product);
  }

  void removeToCart({required Product product}) {
    this.carts.value.remove(product);
  }

  bool checkCart({required Product product}) {
    return carts.value.where((element) => element == product).isNotEmpty;
  }
}
