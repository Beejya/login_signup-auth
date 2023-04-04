import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.quantity,
    required this.vendor_id,
  });

  String id;
  String name;
  String description;
  String price;
  String category;
  String image;
  String quantity;
  String vendor_id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        image: json["image"],
        quantity: json["quantity"],
        vendor_id: json["vendor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "image": image,
        "quantity": quantity,
        "vendor_id": vendor_id,
      };

  toMap() {}
}
