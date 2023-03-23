import 'package:clothywave/Pages/productdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/Base_url.dart';
import '../controller/favouriteController.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final favouriteController = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: favouriteController.carts.isNotEmpty
            ? Column(
                children: favouriteController.carts.map((product) {
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
                      child: SizedBox(
                        height: 120,
                        child: ListTile(
                          tileColor: Colors.grey[200],
                          leading: Container(
                            child: Image.network(
                              baseUrl + "${product.image}",
                              height: 100,
                              width: 100,
                            ),
                          ),
                          title: Text(product.name),
                          subtitle: Text(
                              "Rs: ${product.price}\nDescription: ${product.description}"),
                          trailing: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        favouriteController.removeTofavourite(
                                            product: product);
                                      });
                                    },
                                    icon: Icon(Icons.favorite),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
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
                            'There is no product in favourite list\nClick favourite icon to  add in favourite list',
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
    );
  }
}
