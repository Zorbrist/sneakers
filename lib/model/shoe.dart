// To parse this JSON data, do
//
//     final shoe = shoeFromJson(jsonString);

import 'dart:convert';

List<Shoe> shoeFromJson(String str) => List<Shoe>.from(json.decode(str).map((x) => Shoe.fromJson(x)));

String shoeToJson(List<Shoe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shoe {
  String id;
  String name;
  String details;
  String price;
  String image01;
  String image02;
  String image03;

  Shoe({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.image01,
    required this.image02,
    required this.image03,
  });

  factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
    id: json["id"],
    name: json["name"],
    details: json["details"],
    price: json["price"],
    image01: json["image_01"],
    image02: json["image_02"],
    image03: json["image_03"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "details": details,
    "price": price,
    "image_01": image01,
    "image_02": image02,
    "image_03": image03,
  };
}
