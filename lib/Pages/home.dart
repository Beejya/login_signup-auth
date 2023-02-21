import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothywave/Pages/all_product.dart';
import 'package:clothywave/Pages/kids_product.dart';
import 'package:clothywave/Pages/men_product.dart';
import 'package:clothywave/Pages/women_product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {"id": 1, "image_path": "Assets/images/cloth1.jpeg"},
    {"id": 2, "image_path": "Assets/images/cloth2.jpg"},
    {"id": 3, "image_path": "Assets/images/cloth3.jpeg"},
  ];

  final CarouselController carouselCOntroller = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        print(currentIndex);
                      },
                      child: CarouselSlider(
                        items: imageList
                            .map((item) => Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ))
                            .toList(),
                        carouselController: carouselCOntroller,
                        options: CarouselOptions(
                          scrollPhysics: BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    )
                  ],
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
