// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert';

List<ProductsModel> productsModelFromJson(str) =>
    List<ProductsModel>.from(str.map((x) => ProductsModel.fromJson(x)));

class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final Category category;
  final String image;
  final Rating rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsModel.fromRawJson(String str) =>
      ProductsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse[category],
    "image": image,
    "rating": rating.toJson(),
  };
}

enum Category { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING,
});

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(rate: json["rate"]?.toDouble(), count: json["count"]);

  Map<String, dynamic> toJson() => {"rate": rate, "count": count};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// import 'dart:convert';

// List<ProductsModel> productsModelFromJson(str) =>
//     List<ProductsModel>.from(str.map((x) => ProductsModel.fromJson(x)));

// class ProductsModel {
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;

//   ProductsModel({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.image,
//     this.rating,
//   });

//   factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
//     id: json["id"],
//     title: json["title"],
//     price: json["price"]?.toDouble(),
//     description: json["description"],
//     category: json["category"],
//     image: json["image"],
//     rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
//   );
// }

// class Rating {
//   double? rate;
//   int? count;

//   Rating({this.rate, this.count});

//   factory Rating.fromJson(Map<String, dynamic> json) =>
//       Rating(rate: json["rate"]?.toDouble(), count: json["count"]);
// }
