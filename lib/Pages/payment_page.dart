import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';

class Payment extends StatefulWidget {
  String totalCost;

  Payment({
    super.key,
    required this.totalCost,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

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
          "Make Payment Khalti",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      "Total Price:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.totalCost,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter the delivery address",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30),
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
                    final initialModel = await Khalti.service.initiatePayment(
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
                              decoration: InputDecoration(label: Text('OTP')),
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
                                content:
                                    Text("Verification Tokem: ${model.token}"),
                              );
                            });
                      } catch (e) {}
                    }
                  },
                  child: Text("Make Payment"))
            ]),
      ),
    );
  }
}
