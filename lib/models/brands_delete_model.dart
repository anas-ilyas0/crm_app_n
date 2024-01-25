// To parse this JSON data, doimport
//
//     final brandsDeleteModel = brandsDeleteModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

BrandsDeleteModel brandsDeleteModelFromJson(String str) =>
    BrandsDeleteModel.fromJson(json.decode(str));

String brandsDeleteModelToJson(BrandsDeleteModel data) =>
    json.encode(data.toJson());

class BrandsDeleteModel {
  List<Data> data;

  BrandsDeleteModel({
    required this.data,
  });

  factory BrandsDeleteModel.fromJson(Map<String, dynamic> json) =>
      BrandsDeleteModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int id;
  String title;
  String icon;
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
        icon: json["icon"],
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
