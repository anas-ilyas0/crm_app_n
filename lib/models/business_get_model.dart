// To parse this JSON data, do
//
//     final businessGetModel = businessGetModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

BusinessGetModel businessGetModelFromJson(String str) =>
    BusinessGetModel.fromJson(json.decode(str));

String businessGetModelToJson(BusinessGetModel data) =>
    json.encode(data.toJson());

class BusinessGetModel {
  int code;
  String message;
  List<Data> data;

  BusinessGetModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BusinessGetModel.fromJson(Map<String, dynamic> json) =>
      BusinessGetModel(
        code: json["code"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int id;
  String businessName;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.businessName,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        businessName: json["business_name"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_name": businessName,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
