// To parse this JSON data, do
//
//     final brandsGetModel = brandsGetModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

//import 'package:meta/meta.dart';
import 'dart:convert';

BrandsGetModel brandsGetModelFromJson(String str) =>
    BrandsGetModel.fromJson(json.decode(str));

String brandsGetModelToJson(BrandsGetModel data) => json.encode(data.toJson());

class BrandsGetModel {
  List<Data> data;

  BrandsGetModel({
    required this.data,
  });

  factory BrandsGetModel.fromJson(Map<String, dynamic> json) => BrandsGetModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int id;
  String title;
  dynamic icon;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Data({
    required this.id,
    required this.title,
    required this.icon,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        icon: json["icon"] != null ? json["icon"] : null.toString(),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
