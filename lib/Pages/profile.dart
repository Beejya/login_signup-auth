import 'dart:convert';
import 'dart:io';
import 'package:clothywave/Pages/edit_profile.dart';
import 'package:clothywave/Pages/signin.dart';
import 'package:clothywave/Services/Base_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'about_page.dart';

class Profile extends StatefulWidget {
  String email;
  String name;
  String id;
  Profile(
      {super.key, required this.email, required this.name, required this.id});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: CircleAvatar(
              radius: 50.0,
              child: Text("${widget.name}"),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Email: ${widget.email}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Container(
              child: Column(
            children: [
              Divider(
                thickness: 2,
              ),
              InkWell(
                onTap: () {
                  Get.to(EditProfile(
                      name: widget.name, id: widget.id, email: widget.email));
                },
                child: ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.grey[300]),
                    child: Icon(Icons.person),
                  ),
                  title: Text("Update Profile"),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Icon(Icons.arrow_right),
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.grey[300]),
                  child: Icon(Icons.shopping_bag),
                ),
                title: Text("Order History"),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(Icons.arrow_right),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(About());
                },
                child: ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.grey[300]),
                    child: Icon(Icons.help),
                  ),
                  title: Text("About"),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Icon(Icons.arrow_right),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(signin());
                },
                child: ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.grey[300]),
                    child: Icon(Icons.logout),
                  ),
                  title: Text("Log Out"),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Icon(Icons.arrow_right),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
