// To parse this JSON data, do
//
//     final businessDeleteModel = businessDeleteModelFromJson(jsonString);
//import 'package:meta/meta.dart';
import 'dart:convert';

BusinessDeleteModel businessDeleteModelFromJson(String str) =>
    BusinessDeleteModel.fromJson(json.decode(str));

String businessDeleteModelToJson(BusinessDeleteModel data) =>
    json.encode(data.toJson());

class BusinessDeleteModel {
  bool success;
  String message;
  dynamic data;

  BusinessDeleteModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BusinessDeleteModel.fromJson(Map<String, dynamic> json) =>
      BusinessDeleteModel(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
