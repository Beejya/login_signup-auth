import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              onPressed: () {},
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      child: Text("Category",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Text(
                                  "For Mens",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Text(
                                  "For Women",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Text(
                                  "For Kids",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Text(
                                  "For All",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Text(
                                  "Discounted",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                              child: Center(
                                child: Text(
                                  "Trandings",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
