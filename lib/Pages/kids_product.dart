import 'package:flutter/material.dart';

class KidsProduct extends StatefulWidget {
  const KidsProduct({super.key});

  @override
  State<KidsProduct> createState() => _KidsProductState();
}

class _KidsProductState extends State<KidsProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Kids Product"),
    );
  }
}
