// To parse this JSON data, do
//
//     final categoriesEditModel = categoriesEditModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

CategoriesEditModel categoriesEditModelFromJson(String str) =>
    CategoriesEditModel.fromJson(json.decode(str));

String categoriesEditModelToJson(CategoriesEditModel data) =>
    json.encode(data.toJson());

class CategoriesEditModel {
  Data data;

  CategoriesEditModel({
    required this.data,
  });

  factory CategoriesEditModel.fromJson(Map<String, dynamic> json) =>
      CategoriesEditModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String name;
  String description;
  dynamic photo;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photo": photo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
