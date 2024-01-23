// To parse this JSON data, do
//
//     final categoriesGetModel = categoriesGetModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

//import 'package:meta/meta.dart';
import 'dart:convert';

//import 'package:flutter/material.dart';

CategoriesGetModel categoriesGetModelFromJson(String str) =>
    CategoriesGetModel.fromJson(json.decode(str));

String categoriesGetModelToJson(CategoriesGetModel data) =>
    json.encode(data.toJson());

class CategoriesGetModel {
  List<Data> data;

  CategoriesGetModel({
    required this.data,
  });

  factory CategoriesGetModel.fromJson(Map<String, dynamic> json) =>
      CategoriesGetModel(
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        photo: json["photo"] != null ? json["photo"] : null.toString(),
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
