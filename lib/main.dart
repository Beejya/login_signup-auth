import 'package:clothywave/Pages/signin.dart';
import 'package:clothywave/controller/productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ProductController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signin(),
    );
  }
}
