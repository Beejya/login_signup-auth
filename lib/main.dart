import 'package:clothywave/Pages/profile.dart';
import 'package:clothywave/Pages/signin.dart';
import 'package:clothywave/controller/productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'controller/favouriteController.dart';

void main() async {
  Get.put(FavouriteController());
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
    return KhaltiScope(
      publicKey: 'test_public_key_7beee384521746beb881bf9ff94f88ba',
      enabledDebugging: true,
      builder: (context, navKey) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: signin(),
            navigatorKey: navKey,
            localizationsDelegates: const [KhaltiLocalizations.delegate]);
      },
    );
  }
}
