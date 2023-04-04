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

  String totalPrice() {
    double total = 0.0;
    for (var product in carts) {
      total += double.parse(product.price) as double;
    }
    return total.toString();
  }

  bool checkCart({required Product product}) {
    return carts.value.where((element) => element == product).isNotEmpty;
  }

  map(String Function(dynamic product) param0) {}
}
