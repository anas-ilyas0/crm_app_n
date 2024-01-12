// To parse this JSON data, do
//
//     final editBusiness = editBusinessFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

EditBusiness editBusinessFromJson(String str) =>
    EditBusiness.fromJson(json.decode(str));

String editBusinessToJson(EditBusiness data) => json.encode(data.toJson());

class EditBusiness {
  bool success;
  String message;

  EditBusiness({
    required this.success,
    required this.message,
  });

  factory EditBusiness.fromJson(Map<String, dynamic> json) => EditBusiness(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
