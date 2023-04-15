// To parse this JSON data, do
//
//     final orderConfirm = orderConfirmFromJson(jsonString);

import 'dart:convert';

List<OrderConfirm> orderConfirmFromJson(String str) => List<OrderConfirm>.from(
    json.decode(str).map((x) => OrderConfirm.fromJson(x)));

String orderConfirmToJson(List<OrderConfirm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderConfirm {
  OrderConfirm({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.totalPrice,
    required this.quantityOrder,
    required this.productId,
    required this.deliveryCity,
    required this.deliveryAddress,
    required this.contactNumber,
    required this.paymentStatus,
    required this.vendorId,
  });

  String id;
  String orderId;
  String userId;
  String totalPrice;
  String quantityOrder;
  String productId;
  String deliveryCity;
  String deliveryAddress;
  String contactNumber;
  String paymentStatus;
  String vendorId;

  factory OrderConfirm.fromJson(Map<String, dynamic> json) => OrderConfirm(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        totalPrice: json["total_price"],
        quantityOrder: json["quantity_order"],
        productId: json["product_id"],
        deliveryCity: json["delivery_city"],
        deliveryAddress: json["delivery_address"],
        contactNumber: json["contact_number"],
        paymentStatus: json["payment_status"],
        vendorId: json["vendor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "user_id": userId,
        "total_price": totalPrice,
        "quantity_order": quantityOrder,
        "product_id": productId,
        "delivery_city": deliveryCity,
        "delivery_address": deliveryAddress,
        "contact_number": contactNumber,
        "payment_status": paymentStatus,
        "vendor_id": vendorId,
      };
}
