import 'package:clothywave/Pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 20, right: 15),
      child: GestureDetector(
        onTap: () {},
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("Assets/images/cloth1.jpeg"),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Colors.grey),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("My account"), Icon(Icons.person)],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("My Notification"),
                      Icon(Icons.notifications)
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("My Settings"), Icon(Icons.settings)],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signin()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Log Out"), Icon(Icons.login)],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
