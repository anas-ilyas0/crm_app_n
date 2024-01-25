// To parse this JSON data, do
//import
//     final warehousesGetModel = warehousesGetModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

WarehousesGetModel warehousesGetModelFromJson(String str) =>
    WarehousesGetModel.fromJson(json.decode(str));

String warehousesGetModelToJson(WarehousesGetModel data) =>
    json.encode(data.toJson());

class WarehousesGetModel {
  List<Data> data;

  WarehousesGetModel({
    required this.data,
  });

  factory WarehousesGetModel.fromJson(Map<String, dynamic> json) =>
      WarehousesGetModel(
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
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic address;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "address": address,
      };
}
