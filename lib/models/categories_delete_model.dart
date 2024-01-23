// To parse this JSON data, do
//
//     final categoriesDeleteModel = categoriesDeleteModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

CategoriesDeleteModel categoriesDeleteModelFromJson(String str) =>
    CategoriesDeleteModel.fromJson(json.decode(str));

String categoriesDeleteModelToJson(CategoriesDeleteModel data) =>
    json.encode(data.toJson());

class CategoriesDeleteModel {
  List<Data> data;

  CategoriesDeleteModel({
    required this.data,
  });

  factory CategoriesDeleteModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDeleteModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int id;
  String name;
  dynamic description;
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
