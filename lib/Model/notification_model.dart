// To parse this JSON data, do
//
//     final notificationdata = notificationdataFromJson(jsonString);

import 'dart:convert';

List<Notificationdata> notificationdataFromJson(String str) =>
    List<Notificationdata>.from(
        json.decode(str).map((x) => Notificationdata.fromJson(x)));

String notificationdataToJson(List<Notificationdata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notificationdata {
  Notificationdata({
    required this.id,
    required this.title,
    required this.message,
  });

  String id;
  String title;
  String message;

  factory Notificationdata.fromJson(Map<String, dynamic> json) =>
      Notificationdata(
        id: json["id"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "message": message,
      };
}
