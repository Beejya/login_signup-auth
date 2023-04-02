import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Services/Base_url.dart';

class EditProfile extends StatefulWidget {
  String? name;
  String? id;
  String? email;
  EditProfile({super.key, this.name, this.id, this.email});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> makePostRequest() async {
    // Check if any of the text controllers are empty
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        numberController.text.isEmpty ||
        addressController.text.isEmpty) {
      print('One or more fields are empty');
      return;
    }

    // Make the HTTP POST request
    var url = Uri.parse(baseUrl + 'updateprfile.php');
    var response = await http.post(url, body: {
      'id': widget.id,
      'name': nameController.text,
      'email': emailController.text,
      'contact': numberController.text,
      'address': addressController.text
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    nameController.clear();
    emailController.clear();
    numberController.clear();
    addressController.clear();

    // Show a GetX Snackbar notification based on the response status
    if (response.statusCode == 200) {
      Get.snackbar(
        'Success',
        'Profile updated successfully',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to update profile',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

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
            "Profile",
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                // SizedBox(height: 5),
                Text("${widget.email}"),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Enter to update your profile'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name to change';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                    hintText: 'username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Text("User ID: ${widget.id}")),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 220,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email to change';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Enter your email',
                          hintText: 'example@gmail.com',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                )),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your number to change';
                    }
                    return null;
                  },
                  controller: numberController,
                  decoration: InputDecoration(
                    labelText: 'Enter your conatct number',
                    hintText: 'Contact number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address to change';
                    }
                    return null;
                  },
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Enter your address',
                    hintText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 370,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.blue, // set border color
                      width: 1.0, // set border width
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        makePostRequest();
                      }
                      // makePostRequest();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 5, // elevation
                    ),
                    child: Text('Update profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
