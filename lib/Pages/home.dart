// ignore_for_file: unused_field

import 'dart:convert';

import 'package:clothywave/Pages/all_product.dart';
import 'package:clothywave/Pages/cart_page.dart';
import 'package:clothywave/Pages/kids_product.dart';
import 'package:clothywave/Pages/men_product.dart';
import 'package:clothywave/Pages/women_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                onPressed: () {},
              )
            ],
            backgroundColor: Colors.blue,
            title: Text(
              "Clothywave",
              style: TextStyle(color: Colors.black),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "What are you looking for?"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Text("Category",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: ("All"),
                      ),
                      Tab(
                        text: ("Men"),
                      ),
                      Tab(
                        text: ("Women"),
                      ),
                      Tab(
                        text: ("Kids"),
                      ),
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.74,
                  child: TabBarView(children: [
                    AllProduct(),
                    MenProduct(),
                    WomenProduct(),
                    KidsProduct(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
