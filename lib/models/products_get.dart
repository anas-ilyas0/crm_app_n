// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  int code;
  String message;
  List<Data> data;

  ProductsModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int id;
  String name;
  String productCode;
  int actualPrice;
  int salePrice;
  int wareHouseId;
  String description;
  int stockQuantity;
  int alertQuantity;
  String thumbnail;
  String hsnSacCode;
  String productSize;
  String productWeight;
  String brandId;
  int businessId;
  List<Category> category;
  Category? wareHouse;
  String brand;
  Business? business;

  Data({
    required this.id,
    required this.name,
    required this.productCode,
    required this.actualPrice,
    required this.salePrice,
    required this.wareHouseId,
    required this.description,
    required this.stockQuantity,
    required this.alertQuantity,
    required this.thumbnail,
    required this.hsnSacCode,
    required this.productSize,
    required this.productWeight,
    required this.brandId,
    required this.businessId,
    required this.category,
    this.wareHouse,
    required this.brand,
    this.business,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"] ?? '',
        productCode: json["product_code"] ?? '',
        actualPrice: json["actual_price"] ?? 0,
        salePrice: json["sale_price"] ?? 0,
        wareHouseId: json["ware_house_id"] ?? 0,
        description: json["description"] ?? '',
        stockQuantity: json["stock_quantity"] ?? 0,
        alertQuantity: json["alert_quantity"] ?? 0,
        thumbnail: json["thumbnail"] ?? '',
        hsnSacCode: json["hsn_sac_code"] ?? '',
        productSize: json["product_size"] ?? '',
        productWeight: json["product_weight"] ?? '',
        brandId: json["brand_id"] ?? '',
        businessId: json["business_id"] ?? 0,
        category: json["category"] != null
            ? List<Category>.from(
                json["category"].map((x) => Category.fromJson(x)))
            : [],
        wareHouse: json["ware_house"] != null
            ? Category.fromJson(json["ware_house"])
            : null,
        brand: json["brand"] ?? '',
        business: json["business"] != null
            ? Business.fromJson(json["business"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_code": productCode,
        "actual_price": actualPrice,
        "sale_price": salePrice,
        "ware_house_id": wareHouseId,
        "description": description,
        "stock_quantity": stockQuantity,
        "alert_quantity": alertQuantity,
        "thumbnail": thumbnail,
        "hsn_sac_code": hsnSacCode,
        "product_size": productSize,
        "product_weight": productWeight,
        "brand_id": brandId,
        "business_id": businessId,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "ware_house": wareHouse?.toJson(),
        "brand": brand,
        "business": business!.toJson(),
      };
}

class Business {
  int id;
  String businessName;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  Business({
    required this.id,
    required this.businessName,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["id"],
        businessName: json["business_name"] ?? '',
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

class Category {
  int id;
  String name;
  String description;
  String? photo;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Pivot? pivot;
  dynamic address;

  Category({
    required this.id,
    required this.name,
    required this.description,
    this.photo,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.pivot,
    this.address,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: json["pivot"] != null ? Pivot.fromJson(json["pivot"]) : null,
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photo": photo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot?.toJson(),
        "address": address,
      };
}

class Pivot {
  int productId;
  int productCategoryId;

  Pivot({
    required this.productId,
    required this.productCategoryId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        productCategoryId: json["product_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_category_id": productCategoryId,
      };
}
