import 'dart:convert';

import 'package:clothywave/Pages/productdetailpage.dart';
import 'package:clothywave/Services/Base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:http/http.dart' as http;

import '../Model/product.dart';
import '../controller/favouriteController.dart';
import '../controller/productController.dart';

class MenProduct extends StatefulWidget {
  const MenProduct({super.key});

  @override
  State<MenProduct> createState() => _MenProductState();
}

class _MenProductState extends State<MenProduct> {
  // List productdata = [];
  List<Product> products = [];

  Future<String> getProductData() async {
    var response = await http.get(Uri.parse(baseUrl + "men_category.php"));
    setState(() {
      products = productFromJson(response.body);
      // productdata = json.decode(response.body);
    });
    return "Sucess";
  }

  @override
  void initState() {
    getProductData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 310),
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(
                            product: products[index],
                          )),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.lightBlueAccent),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          child: Image.network(
                            baseUrl + "${products[index].image}",
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${products[index].name}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Price: RS"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${products[index].price}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GetX<FavouriteController>(
                                      builder: (controller) {
                                    return IconButton(
                                        onPressed: () {
                                          if (!controller.checkfavourite(
                                              product: products[index])) {
                                            controller.addTofavourite(
                                                product: products[index]);
                                          } else {
                                            controller.removeTofavourite(
                                                product: products[index]);
                                          }

                                          setState(() {});
                                        },
                                        icon: Icon(
                                          controller.checkfavourite(
                                                  product: products[index])
                                              ? Icons.favorite
                                              : Icons.favorite_outline_outlined,
                                          color: controller.checkfavourite(
                                                  product: products[index])
                                              ? Colors.red
                                              : null,
                                        ));
                                  }),
                                  GetX<ProductController>(
                                      builder: (controller) {
                                    return IconButton(
                                        onPressed: () {
                                          if (!controller.checkCart(
                                              product: products[index])) {
                                            controller.addToCart(
                                                product: products[index]);
                                          } else {
                                            controller.removeToCart(
                                                product: products[index]);
                                          }

                                          setState(() {});
                                        },
                                        icon: Icon(
                                          controller.checkCart(
                                                  product: products[index])
                                              ? Icons.shopping_cart
                                              : Icons
                                                  .shopping_cart_checkout_outlined,
                                          color: controller.checkCart(
                                                  product: products[index])
                                              ? Colors.red
                                              : null,
                                        ));
                                  })
                                ],
                              )
                            ],
                          ),
                        )
                      ])),
            ),
          );
        }));
  }
}
