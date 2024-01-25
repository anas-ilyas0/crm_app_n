// To parse this JSON data, do
//
//     final brandEditModel = brandEditModelFromJson(jsonString);
import 'dart:convert';

BrandEditModel brandEditModelFromJson(String str) =>
    BrandEditModel.fromJson(json.decode(str));

String brandEditModelToJson(BrandEditModel data) => json.encode(data.toJson());

class BrandEditModel {
  Data data;

  BrandEditModel({
    required this.data,
  });

  factory BrandEditModel.fromJson(Map<String, dynamic> json) => BrandEditModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
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
