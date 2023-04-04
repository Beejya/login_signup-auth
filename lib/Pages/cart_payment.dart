import 'dart:convert';
import 'package:clothywave/Pages/cart_page.dart';
import 'package:clothywave/Services/Base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:khalti_flutter/khalti_flutter.dart';
import '../Model/product.dart';
import '../controller/productController.dart';

enum payment { online_payment, cash_on_delivery }

class CartPayment extends StatefulWidget {
  String? id;
  String? totalCost;
  CartPayment({super.key, this.totalCost, this.id});

  @override
  State<CartPayment> createState() => _CartPaymentState();
}

class _CartPaymentState extends State<CartPayment> {
  final productController = Get.find<ProductController>();

  Future<void> _insertData() async {
    if (contactNumber.text.isEmpty ||
        deliveryCity.text.isEmpty ||
        deliveryAddress.text.isEmpty) {
      return;
    }

    var uploadurl = Uri.parse("${baseUrl}cartorder.php");
    try {
      var response = await http.post(uploadurl, body: {
        'total_price':
            productController.carts.map((product) => product.price).join(','),
        'quantity_order': '1',
        'product_id':
            productController.carts.map((product) => product.id).join(','),
        'contact_number': contactNumber.text,
        'delivery_city': deliveryCity.text,
        'delivery_address': deliveryAddress.text,
        'payment_status': selectedstatus.toString(),
        'vendor_id': productController.carts
            .map((product) => product.vendor_id)
            .join(','),
        'userid': "${widget.id.toString()}"
      });

      if (response.statusCode == 200) {
        Get.snackbar("Sucessful", "Your Order is placed sucessfully",
            backgroundColor: Colors.green[500],
            snackPosition: SnackPosition.TOP);
        dispose();
        setState(() {
          contactNumber.clear();
          deliveryAddress.clear();
          deliveryCity.clear();
        });
        var jsondata = json.decode(response.body);
        if (jsondata['error']) {
          print(jsondata['msg']);
        } else {
          print("Error ");
        }
      } else {
        print("Error during connection to server");
      }
    } catch (e) {
      super.dispose();
      print("upload sucessful");
    }
  }

  @override
  void initState() {
    contactNumber.text;
    deliveryAddress.text;
    deliveryCity.text;
  }

  @override
  void dispose() {
    contactNumber.clear();
    deliveryAddress.clear();
    deliveryCity.clear();
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController deliveryCity = TextEditingController();
  TextEditingController deliveryAddress = TextEditingController();

  payment selectedstatus = payment.online_payment;

  bool _forcash = false;
  bool _foronline = false;

  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Buy all Cart product",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Total Price:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.totalCost.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(children: [
                    Column(
                      children: [
                        Column(
                          children: productController.carts.map((product) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
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
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      "Enter detail to place order",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      controller: contactNumber,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter contact Number",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter contact Number!";
                        }
                        {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      controller: deliveryCity,
                      decoration: InputDecoration(
                        hintText: "Enter the delivery city",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter city for delivery!";
                        }
                        {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      controller: deliveryAddress,
                      decoration: InputDecoration(
                        hintText: "Enter the delivery address",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a delivery address";
                        }
                        {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black45,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "For the Payment",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: payment.online_payment,
                            groupValue: selectedstatus,
                            onChanged: (value) {
                              setState(() {
                                selectedstatus = payment.online_payment;
                              });
                            },
                          ),
                          Text(
                            'Make Payment online',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                      onPressed: () {
                        payWithKhaltiInAPP();
                      },
                      icon: Icon(Icons.money),
                      label: Text("Make a paymant through khalti")),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black45,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: payment.cash_on_delivery,
                            groupValue: selectedstatus,
                            onChanged: (value) {
                              setState(() {
                                selectedstatus = payment.cash_on_delivery;
                              });
                            },
                          ),
                          Text(
                            'Cash On delivery',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 320,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _insertData();
                          },
                          icon: Icon(Icons.shopping_bag),
                          label: Text('Place Order'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueAccent),
                            elevation: MaterialStateProperty.all<double>(4),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }

  payWithKhaltiInAPP() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: 1000, productIdentity: "product id", productName: "name"),
      preferences: [PaymentPreference.khalti],
      onSuccess: onSucess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSucess(PaymentSuccessModel sucess) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Payment Sucessful"),
            actions: [
              SimpleDialogOption(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }

  void onCancel() {
    debugPrint("Cancelled");
  }
}
