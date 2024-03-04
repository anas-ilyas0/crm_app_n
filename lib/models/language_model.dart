// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

LanguageModel languageModelFromJson(String str) =>
    LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  int code;
  String message;
  List<Data> data;

  LanguageModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
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
  String language;
  String code;
  String isRtl;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Data({
    required this.id,
    required this.language,
    required this.code,
    required this.isRtl,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        language: json["language"] ?? '',
        code: json["code"] ?? '',
        isRtl: json["is_rtl"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "language": language,
        "code": code,
        "is_rtl": isRtl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
