import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WomenProduct extends StatefulWidget {
  const WomenProduct({super.key});

  @override
  State<WomenProduct> createState() => _WomenProductState();
}

class _WomenProductState extends State<WomenProduct> {
  List productdata = [];

  Future<String> getProductData() async {
    var response = await http
        .get(Uri.parse("http://192.168.0.77/clothstore/Women_category.php"));
    setState(() {
      productdata = json.decode(response.body);
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
        itemCount: productdata.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
                          "http://192.168.0.77/clothstore/${productdata[index]["image"]}",
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
                                  "${productdata[index]["name"]}",
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
                                  "${productdata[index]["price"]}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_border_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.shopping_cart))
                              ],
                            )
                          ],
                        ),
                      )
                    ])),
          );
        }));
  }
}
