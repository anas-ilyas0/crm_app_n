// To parse this JSON data, do
//
//     final categoriesPostModel = categoriesPostModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

CategoriesPostModel categoriesPostModelFromJson(String str) =>
    CategoriesPostModel.fromJson(json.decode(str));

String categoriesPostModelToJson(CategoriesPostModel data) =>
    json.encode(data.toJson());

class CategoriesPostModel {
  Data data;

  CategoriesPostModel({
    required this.data,
  });

  factory CategoriesPostModel.fromJson(Map<String, dynamic> json) =>
      CategoriesPostModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  String name;
  String description;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.name,
    required this.description,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
