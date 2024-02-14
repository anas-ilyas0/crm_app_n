// To parse this JSON data, do
//
//     final brandsPostModel = brandsPostModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

BrandsPostModel brandsPostModelFromJson(String str) =>
    BrandsPostModel.fromJson(json.decode(str));

String brandsPostModelToJson(BrandsPostModel data) =>
    json.encode(data.toJson());

class BrandsPostModel {
  Data data;

  BrandsPostModel({
    required this.data,
  });

  factory BrandsPostModel.fromJson(Map<String, dynamic> json) =>
      BrandsPostModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  String title;
  dynamic icon;
  String status;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.title,
    required this.icon,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"] ?? 'null',
        icon: json["icon"],
        status: json["status"] ?? 'null',
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
