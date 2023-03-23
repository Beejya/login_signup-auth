import 'package:clothywave/Pages/productdetailpage.dart';
import 'package:clothywave/Services/Base_url.dart';
import 'package:clothywave/controller/productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: productController.carts.isNotEmpty
              ? Column(
                  children: [
                    Column(
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
                                        productController.removeToCart(
                                            product: product);
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
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Text(
                              'There is no product in cart list\nClick cart icon to  add in cart list',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text(
                  "SubTotal: ${productController.totalPrice().toString()}"),
              icon: Icon(Icons.attach_money),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text("Buy all product"),
              icon: Icon(Icons.shopping_cart),
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
            ),
          ],
        ));
  }
}
