import 'package:clothywave/Pages/Home..dart';
import 'package:clothywave/Pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../Model/order_history.dart';
import '../Services/Base_url.dart';
import 'home.dart';

class OrderHistory extends StatefulWidget {
  String? id;
  OrderHistory({super.key, this.id});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<Order> order_detail = [];

  Future<String> getorderData(id) async {
    var response =
        await http.get(Uri.parse(baseUrl + "orderhistory.php?userid=$id"));
    setState(() {
      order_detail = orderFromJson(response.body);
    });
    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    getorderData(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          // HomePage
          backgroundColor: Colors.grey[200],
          elevation: 0,
          title: Text(
            "About Clothywave",
            style: TextStyle(color: Colors.black),
          )),
      body: FutureBuilder(
          future: getorderData(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: order_detail.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          color: Colors.grey[300],
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Order Id: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${order_detail[index].orderId}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Total Price:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "${order_detail[index].totalPrice}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: [
                                          Text("Quantity Order:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "${order_detail[index].quantityOrder}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text("Product ID: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "${order_detail[index].productId}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text("Delivery City: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "${order_detail[index].deliveryCity}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text("Delivery address: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "${order_detail[index].deliveryAddress}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text("Payment_status: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "${order_detail[index].paymentStatus}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }))
                : Center(
                    child: Container(
                      child: Text(
                        "No order is placed",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
          }),
    );
  }
}
