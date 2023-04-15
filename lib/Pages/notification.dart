import 'package:clothywave/Model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Services/Base_url.dart';

class Notification_page extends StatefulWidget {
  const Notification_page({Key? key});

  @override
  State<Notification_page> createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  bool _isChecked = false;
  List<Notificationdata> notification = [];

  Future<String> getnotification() async {
    var response =
        await http.get(Uri.parse("${baseUrl}usernotificationlist.php"));
    setState(() {
      notification = notificationdataFromJson(response.body);
    });
    return "Success";
  }

  @override
  void initState() {
    super.initState();
    getnotification();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              "Notifications",
              style: TextStyle(color: Colors.black),
            )),
        body: FutureBuilder(
            future: getnotification(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: notification.length,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ListTile(
                              tileColor: Colors.grey[200],
                              leading: Text('${index + 1}.'),
                              title: Text("${notification[index].title}"),
                              subtitle: Text("${notification[index].message}"),
                              trailing: StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Checkbox(
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      }))
                  : Center(
                      child: Container(
                        child: Text(
                          "No Notification to Show",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
            }));
  }
}
