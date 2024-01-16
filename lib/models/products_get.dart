// To parse this JSON data, do
//
//     final getProducts = getProductsFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

GetProducts getProductsFromJson(String str) =>
    GetProducts.fromJson(json.decode(str));

String getProductsToJson(GetProducts data) => json.encode(data.toJson());

class GetProducts {
  int code;
  String message;
  List<Data> data;

  GetProducts({
    required this.code,
    required this.message,
    required this.data,
  });

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
        code: json["code"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  String label;
  String name;

  Data({
    required this.label,
    required this.name,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        label: json["label"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "name": name,
      };
}
