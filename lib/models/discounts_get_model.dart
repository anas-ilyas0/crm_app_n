// To parse this JSON data, do
//
//     final discountsGetModel = discountsGetModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

DiscountsGetModel discountsGetModelFromJson(String str) =>
    DiscountsGetModel.fromJson(json.decode(str));

String discountsGetModelToJson(DiscountsGetModel data) =>
    json.encode(data.toJson());

class DiscountsGetModel {
  List<Data> data;

  DiscountsGetModel({
    required this.data,
  });

  factory DiscountsGetModel.fromJson(Map<String, dynamic> json) =>
      DiscountsGetModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int id;
  String name;
  int discount;
  String discountType;
  dynamic description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Data({
    required this.id,
    required this.name,
    required this.discount,
    required this.discountType,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        discount: json["discount"] ?? 0,
        discountType: json["discount_type"] ?? 'null',
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "discount": discount,
        "discount_type": discountType,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
