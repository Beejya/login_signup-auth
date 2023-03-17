import 'package:clothywave/Pages/payment_page.dart';
import 'package:clothywave/Services/Base_url.dart';
// import 'package:clothywave/controller/cartController.dart';
import 'package:clothywave/controller/productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/product.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

final productController = Get.find<ProductController>();

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    getTotalPrice(1);
    super.initState();
  }

  int counter = 1;
  int total = 0;
  String pricePassed = "";
  int price = 0;

  getTotalPrice(counter) {
    setState(() {
      pricePassed = widget.product.price;
      price = int.parse(pricePassed);
      total = counter * price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Produt Detail")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Image(
                    image: NetworkImage(baseUrl + "${widget.product.image}"),
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Text(
                        "Name:",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.product.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Text(
                        "Price:",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.product.price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Text(
                        "Description:",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: Text(
                    widget.product.description,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 30,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Text(
                        "Aviliable quantity:",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.product.quantity,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Text(
                        "Quantity to buy:",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    new IconButton(
                        onPressed: () {
                          setState(() {
                            if (counter > 1) counter--;
                            getTotalPrice(counter);
                          });
                        },
                        icon: Icon(Icons.remove)),
                    new Container(),
                    new Text("$counter"),
                    new IconButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                            getTotalPrice(counter);
                          });
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          "Total Price:",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )),
                    Container(
                      child: Text('${total}'),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment(
                                        totalCost: total.toString(),
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlueAccent,
                              side: BorderSide(width: 3, color: Colors.white),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(20)),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
