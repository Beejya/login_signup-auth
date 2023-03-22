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
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: Text("image"),
          ),
          Text("Bijay"),
          Text("Bijaykc@gmail.com"),
          ElevatedButton(onPressed: () {}, child: Text("Edit")),
          Divider(
            thickness: 3,
          ),
          ListTile(
            leading: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.grey[300]),
              child: Icon(Icons.person),
            ),
            title: Text("Profile"),
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
          ListTile(
            leading: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.grey[300]),
              child: Icon(Icons.settings),
            ),
            title: Text("Setting"),
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
          ListTile(
            leading: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.grey[300]),
              child: Icon(Icons.help),
            ),
            title: Text("Help"),
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
          ListTile(
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
          )
        ],
      )),
    );
  }
}
