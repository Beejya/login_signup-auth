import 'package:clothywave/Pages/all_product.dart';
import 'package:clothywave/Pages/payment_page.dart';
import 'package:clothywave/Services/Base_url.dart';
// import 'package:clothywave/controller/cartController.dart';
import 'package:clothywave/controller/productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/product.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  String? id;
  ProductDetail({super.key, required this.product, this.id});

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
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.grey[200],
            elevation: 0,
            title: Text(
              "Produt Detail",
              style: TextStyle(color: Colors.black),
            )),
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
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          widget.product.description,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Text(
                        "Number Aviliable quantity:",
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
                        widget.product.quantity == "0"
                            ? "Out of stock"
                            : "In stock",
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
                            if (counter < int.parse(widget.product.quantity)) {
                              counter++;
                              getTotalPrice(counter);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Maximum quantity reached"),
                                      content: Text(
                                          "You cann't add more than aviliable product "),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Ok"))
                                      ],
                                    );
                                  });
                            }
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
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (int.parse(widget.product.quantity) > 0)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 345,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payment(
                                        id: widget.id,
                                        totalCost: total.toString(),
                                        product: widget.product,
                                        counter: counter.toString())),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
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
