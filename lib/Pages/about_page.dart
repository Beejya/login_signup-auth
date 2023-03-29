import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About extends StatelessWidget {
  const About({super.key});

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
            "About Clothywave",
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: [
                    Text(
                      "Introduction to clothywave",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Our ecommerce app is a one-stop-shop for all your clothing needs. With an easy-to-use interface and a wide range of products from multiple vendors, you can easily browse and purchase clothes that suit your style. Our multivendor clothing store connects you directly with the supplier, eliminating the middleman and ensuring that you get the best possible price.You can make payments online using our secure payment gateway or choose to pay cash on delivery. The online shopping system is designed to simplify your shopping experience by allowing you to select items, communicate directly with suppliers, and track your orders. Vendors have complete control over adding their items, managing customer information, and receiving payments easily.With our ecommerce app, you can enjoy a hassle-free shopping experience from the comfort of your own home. Browse through our extensive collection of clothing and find the perfect outfit for any occasion. Shop with us today and discover a whole new world of online shopping.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: [
                    Text(
                      "Amis of the clothywave",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'To create an efficient system for buying and selling clothes at the best possible price by eliminating the middleman, saving peoples time, providing customers with original brands, and increasing orders.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
