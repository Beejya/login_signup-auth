import 'dart:convert';

import 'package:clothywave/Services/Base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';
import 'package:http/http.dart' as http;
import '../Model/product.dart';

enum payment { online_payment, cash_on_delivery }

class Payment extends StatefulWidget {
  String totalCost;
  Product product;
  String counter;
  String? id;

  Payment(
      {super.key,
      required this.totalCost,
      required this.product,
      required this.counter,
      this.id});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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

  Future<void> _insertData() async {
    if (contactNumber.text.isEmpty ||
        deliveryCity.text.isEmpty ||
        deliveryAddress.text.isEmpty) {
      return;
    }

    var uploadurl = Uri.parse("${baseUrl}orders.php");
    try {
      var response = await http.post(uploadurl, body: {
        'total_price': "${widget.totalCost.toString()}",
        'quantity_order': "${widget.counter.toString()}",
        'product_id': "${widget.product.id.toString()}",
        'contact_number': contactNumber.text,
        'delivery_city': deliveryCity.text,
        'delivery_address': deliveryAddress.text,
        'payment_status': selectedstatus.toString(),
        'vendor_id': "${widget.product.vendor_id.toString()}",
        'userid': "${widget.id.toString()}"
      });

      if (response.statusCode == 200) {
        Get.snackbar("Sucessful", "Your Order is placed sucessfully",
            backgroundColor: Colors.green[300],
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
      // super.dispose();
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
          "Order Detail",
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
                        widget.totalCost,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Product Name:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.product.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Quantity Order:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.counter,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        child: Text(
                          "Product Id:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.product.id,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      controller: contactNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                          // Text("online payment",
                          //     style: TextStyle(
                          //         fontSize: 16, fontWeight: FontWeight.w900)),
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
                  Text(
                    "For the online Payment from Khalti",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 60,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Enter phone number for Khalti payment",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: TextField(
                      controller: pinCodeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter pin code for Khalti payment",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final initialModel = await Khalti.service
                            .initiatePayment(
                                request: PaymentInitiationRequestModel(
                                    amount: 1000,
                                    mobile: phoneController.text,
                                    productIdentity: "pID",
                                    productName: "Product Name",
                                    transactionPin: pinCodeController.text,
                                    productUrl: "",
                                    additionalData: {}));

                        final otp = await showDialog(
                            context: (context),
                            barrierDismissible: false,
                            builder: (context) {
                              String? _otp;
                              return AlertDialog(
                                title: TextField(
                                  onChanged: (v) => _otp = v,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(label: Text('OTP')),
                                ),
                                actions: [
                                  SimpleDialogOption(
                                    child: Text("Submit"),
                                    onPressed: () {
                                      Navigator.pop(context, _otp);
                                    },
                                  )
                                ],
                              );
                            });

                        if (otp != null) {
                          try {
                            final model = await Khalti.service.confirmPayment(
                                request: PaymentConfirmationRequestModel(
                                    confirmationCode: otp,
                                    token: initialModel.token,
                                    transactionPin: pinCodeController.text));

                            showDialog(
                                context: (context),
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Payment Sucessful"),
                                    content: Text(
                                        "Verification Tokem: ${model.token}"),
                                  );
                                });
                          } catch (e) {}
                        }
                      },
                      child: Text("Procced for Payment through Khalti")),
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
                            _submit();
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
}
