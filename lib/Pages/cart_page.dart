import 'package:clothywave/Model/product.dart';
import 'package:clothywave/Pages/home.dart';
import 'package:clothywave/Pages/productdetailpage.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black87,
        ),
        title: Column(
          children: [
            Text(
              "Cart",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
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
                  tileColor: Colors.lightBlueAccent,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "http://192.168.0.77/clothstore/${product.image}"),
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
