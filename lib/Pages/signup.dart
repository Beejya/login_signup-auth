import 'dart:convert';

import 'package:clothywave/Pages/signin.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future register() async {
    var url = "http:// 192.168.0.77/clothstore/signup.php";
    var response = await http.post(Uri.parse(url), body: {
      'name': nameController.text,
      'email': emailController.text,
      'contact': contactController.text,
      'address': addressController.text,
      'password': passwordController.text
    });

    var data = json.decode(response.body);
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    disposee();
    var sucess = data["sucess"];
    if (sucess) {
      Fluttertoast.showToast(
          msg: "User sucessful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const signin()),
      );
    } else {
      Fluttertoast.showToast(
          msg:
              "Email already exit\nPlease enter new email for the registration ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    _formKey.currentState!.save();
  }

  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text;
    emailController.text;
    contactController.text;
    addressController.text;
    passwordController.text;
  }

  @override
  void disposee() {
    nameController.clear();
    emailController.clear();
    contactController.clear();
    addressController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Center(
                    child: Container(
                      child: Text(
                        "Clothywave",
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: Container(
                          child: Text(
                            "Create a new Account ",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return "Enter valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter your Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a Username!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter your Username',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your address!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter your address',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: contactController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a contact Number!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter your Contact Number',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value != null && value.length < 7) {
                          return 'Enter minimum 7 character';
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter your Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                        onPressed: () {
                          register();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              child: Text(
                            "Already  Have an Account?",
                            style: TextStyle(fontSize: 20),
                          )),
                        ),
                        Container(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const signin()),
                                );
                              },
                              child: Text("Sign In")),
                        )
                      ],
                    ),
                  )
                ])))));
  }
}
