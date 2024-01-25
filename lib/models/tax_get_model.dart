// To parse this JSON data, do
//
//     final taxesGetModel = taxesGetModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

TaxesGetModel taxesGetModelFromJson(String str) =>
    TaxesGetModel.fromJson(json.decode(str));

String taxesGetModelToJson(TaxesGetModel data) => json.encode(data.toJson());

class TaxesGetModel {
  List<Data> data;

  TaxesGetModel({
    required this.data,
  });

  factory TaxesGetModel.fromJson(Map<String, dynamic> json) => TaxesGetModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int id;
  String name;
  int rate;
  String rateType;
  dynamic description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Data({
    required this.id,
    required this.name,
    required this.rate,
    required this.rateType,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        rate: json["rate"] ?? 0,
        rateType: json["rate_type"] ?? 'null',
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rate": rate,
        "rate_type": rateType,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
