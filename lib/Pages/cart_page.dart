import 'package:clothywave/Model/product.dart';
import 'package:clothywave/Pages/home.dart';
import 'package:clothywave/Pages/productdetailpage.dart';
import 'package:clothywave/Services/Base_url.dart';
import 'package:clothywave/controller/productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothywave/controller/productController.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({
    super.key,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: productController.carts.map((product) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetail(
                              product: product,
                            )),
                  );
                },
                child: ListTile(
                  leading: Container(
                    child: Image.network(
                      baseUrl + "${product.image}",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text("Rs: ${product.price}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            productController.removeToCart(product: product);
                          });
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
