import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';

class Payment extends StatefulWidget {
  String totalCost;
  Payment({super.key, required this.totalCost});

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
        title: Text("Make Payment Khalti"),
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
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: "Phone Number"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pinCodeController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(labelText: "Pin Code"),
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
