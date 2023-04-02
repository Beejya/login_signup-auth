// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    required this.orderId,
    required this.totalPrice,
    required this.quantityOrder,
    required this.productId,
    required this.contactNumber,
    required this.deliveryCity,
    required this.deliveryAddress,
    required this.paymentStatus,
    required this.vendorId,
    required this.userid,
  });

  String orderId;
  String totalPrice;
  String quantityOrder;
  String productId;
  String contactNumber;
  String deliveryCity;
  String deliveryAddress;
  String paymentStatus;
  String vendorId;
  String userid;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        totalPrice: json["total_price"],
        quantityOrder: json["quantity_order"],
        productId: json["product_id"],
        contactNumber: json["contact_number"],
        deliveryCity: json["delivery_city"],
        deliveryAddress: json["delivery_address"],
        paymentStatus: json["payment_status"],
        vendorId: json["vendor_id"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "total_price": totalPrice,
        "quantity_order": quantityOrder,
        "product_id": productId,
        "contact_number": contactNumber,
        "delivery_city": deliveryCity,
        "delivery_address": deliveryAddress,
        "payment_status": paymentStatus,
        "vendor_id": vendorId,
        "userid": userid,
      };
}
