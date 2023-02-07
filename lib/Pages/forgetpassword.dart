import 'package:clothywave/Pages/signin.dart';
import 'package:clothywave/Pages/signup.dart';
import 'package:flutter/material.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({Key? key}) : super(key: key);

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  final TextEditingController _emailController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
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
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: Container(
                        child: Text(
                          "Reset Password ",
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
                  height: 30,
                ),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
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
                  height: 50,
                ),
                Container(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                      onPressed: () => _submit(),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                SizedBox(
                  height: 50,
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        child: Text(
                      "Don't  Have an Account?",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                  Container(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signup()),
                          );
                        },
                        child: Text("Sign Up")),
                  )
                ]))
              ])))),
    );
  }
}
