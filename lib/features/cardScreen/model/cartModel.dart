// ignore_for_file: file_names

import 'dart:convert';

class Cartmodel {
  int id;
  int userId;
  DateTime date;
  List<Product> products;
  int v;

  Cartmodel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory Cartmodel.fromRawJson(String str) =>
      Cartmodel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cartmodel.fromJson(Map<String, dynamic> json) => Cartmodel(
    id: json["id"],
    userId: json["userId"],
    date: DateTime.parse(json["date"]),
    products: List<Product>.from(
      json["products"].map((x) => Product.fromJson(x)),
    ),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "date": date.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "__v": v,
  };
}

class Product {
  int productId;
  int quantity;

  Product({required this.productId, required this.quantity});

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) =>
      Product(productId: json["productId"], quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };
}
