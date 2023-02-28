import 'package:clothywave/Pages/productdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/product.dart';
import '../Services/Base_url.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Product> products = [];
  Future<String> getProductData() async {
    var response = await http.get(Uri.parse(baseUrl + "imagelist.php"));
    setState(() {
      products = productFromJson(response.body);
    });
    return "Sucess";
  }

  @override
  void initState() {
    getProductData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Product> _filteredData(String searchText) {
    return products
        .where((data) =>
            data.name.toLowerCase().contains(searchText.toLowerCase()) ||
            data.description.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        color: Colors.white,
        child: TextField(
          style: TextStyle(color: Colors.black),
          controller: _searchController,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search here ..',
          ),
        ),
      )),
      body: Column(
        children: [
          Expanded(
            child: _searchController.text.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredData(_searchController.text).length,
                    itemBuilder: (context, index) {
                      final data = _filteredData(_searchController.text)[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                        product: data,
                                      )),
                            );
                          },
                          child: ListTile(
                            leading: Container(
                              child: Image.network(
                                baseUrl + "${data.image}",
                                height: 100,
                                width: 100,
                              ),
                            ),
                            title: Text(data.name),
                            subtitle:
                                Text("${data.price}\n${data.description}"),
                          ),
                        ),
                      );
                    },
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
