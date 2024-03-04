// ignore_for_file: file_names, unnecessary_null_in_if_null_operators

import 'dart:convert';
// To parse this JSON data, do
//
//     final leadsModel = leadsModelFromJson(jsonString);

//import 'package:meta/meta.dart';

LeadsModel leadsModelFromJson(String str) =>
    LeadsModel.fromJson(json.decode(str));

String leadsModelToJson(LeadsModel data) => json.encode(data.toJson());

class LeadsModel {
  int code;
  String message;
  List<Data> data;

  LeadsModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LeadsModel.fromJson(Map<String, dynamic> json) => LeadsModel(
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
  String firstName;
  String lastName;
  // dynamic thumbnail;
  // String phone1Code;
  dynamic phone1;
  // String phone2Code;
  dynamic phone2;
  String email;
  dynamic skype;
  // dynamic address;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;
  int companyId;
  dynamic city;
  dynamic stateRegion;
  dynamic zipPostalCode;
  dynamic taxId;
  dynamic groupId;
  int countryId;
  String deliveryAddress;
  int currencyId;
  dynamic languageId;
  // int ticketEmails;
  String name;
  String fulladdress;
  // dynamic emailVerifiedAt;
  // dynamic password;
  // dynamic rememberToken;
  // dynamic departmentId;
  // int ticketitAdmin;
  // int ticketitAgent;
  // String status;
  // dynamic theme;
  // dynamic portalLanguage;
  // dynamic confirmationCode;
  // dynamic lastLoginFrom;
  // dynamic hourlyRate;
  // String isUser;
  // dynamic colorTheme;
  // String colorSkin;
  // dynamic iposToken;
  // dynamic commissionOnProduct;
  dynamic typeContact;
  // dynamic microsoftToken;
  // dynamic microsoftRefreshToken;
  // dynamic hasExpired;
  // dynamic paymentType;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    // required this.thumbnail,
    // required this.phone1Code,
    required this.phone1,
    // required this.phone2Code,
    required this.phone2,
    required this.email,
    required this.skype,
    // required this.address,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.deletedAt,
    required this.companyId,
    required this.city,
    required this.stateRegion,
    required this.zipPostalCode,
    required this.taxId,
    required this.groupId,
    required this.countryId,
    required this.deliveryAddress,
    required this.currencyId,
    required this.languageId,
    // required this.ticketEmails,
    required this.name,
    required this.fulladdress,
    // required this.emailVerifiedAt,
    // required this.password,
    // required this.rememberToken,
    // required this.departmentId,
    // required this.ticketitAdmin,
    // required this.ticketitAgent,
    // required this.status,
    // required this.theme,
    // required this.portalLanguage,
    // required this.confirmationCode,
    // required this.lastLoginFrom,
    // required this.hourlyRate,
    // required this.isUser,
    // required this.colorTheme,
    // required this.colorSkin,
    // required this.iposToken,
    // required this.commissionOnProduct,
    required this.typeContact,
    // required this.microsoftToken,
    // required this.microsoftRefreshToken,
    // required this.hasExpired,
    // required this.paymentType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        // thumbnail: json["thumbnail"] ?? 'null',
        // phone1Code: json["phone1_code"] ?? '',
        phone1: json["phone1"] ?? 0,
        // phone2Code: json["phone2_code"] ?? '',
        phone2: json["phone2"] ?? 0,
        email: json["email"] ?? '',
        skype: json["skype"] ?? '',
        // address: json["address"] ?? '',
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"] ?? '',
        companyId: json["company_id"] ?? 0,
        city: json["city"] ?? '',
        stateRegion: json["state_region"] ?? '',
        zipPostalCode: json["zip_postal_code"] ?? '',
        taxId: json["tax_id"] ?? '',
        groupId: json["group_id"] ?? 0,
        countryId: json["country_id"] ?? 0,
        deliveryAddress: json["delivery_address"],
        currencyId: json["currency_id"] ?? 0,
        languageId: json["language_id"] ?? 0,
        // ticketEmails: json["ticket_emails"] ?? '',
        name: json["name"] ?? 'null',
        fulladdress: json["fulladdress"] ?? '',
        // emailVerifiedAt: json["email_verified_at"] ?? '',
        // password: json["password"] ?? '',
        // rememberToken: json["remember_token"] ?? '',
        // departmentId: json["department_id"] ?? '',
        // ticketitAdmin: json["ticketit_admin"] ?? '',
        // ticketitAgent: json["ticketit_agent"] ?? '',
        // status: json["status"] ?? '',
        // theme: json["theme"] ?? '',
        // portalLanguage: json["portal_language"] ?? '',
        // confirmationCode: json["confirmation_code"] ?? '',
        // lastLoginFrom: json["last_login_from"] ?? '',
        // hourlyRate: json["hourly_rate"] ?? '',
        // isUser: json["is_user"] ?? '',
        // colorTheme: json["color_theme"] ?? '',
        // colorSkin: json["color_skin"] ?? '',
        // iposToken: json["ipos_token"] ?? '',
        // commissionOnProduct: json["commission_on_product"] ?? '',
        typeContact: json["type_Contact"],
        // microsoftToken: json["microsoft_token"] ?? '',
        // microsoftRefreshToken: json["microsoft_refresh_token"] ?? '',
        // hasExpired: json["has_expired"] ?? '',
        // paymentType: json["payment_type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        // "thumbnail": thumbnail,
        // "phone1_code": phone1Code,
        "phone1": phone1,
        // "phone2_code": phone2Code,
        "phone2": phone2,
        "email": email,
        "skype": skype,
        // "address": address,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        // "deleted_at": deletedAt,
        "company_id": companyId,
        "city": city,
        "state_region": stateRegion,
        "zip_postal_code": zipPostalCode,
        "tax_id": taxId,
        "group_id": groupId,
        "country_id": countryId,
        "delivery_address": deliveryAddress,
        "currency_id": currencyId,
        "language_id": languageId,
        // "ticket_emails": ticketEmails,
        "name": name,
        "fulladdress": fulladdress,
        // "email_verified_at": emailVerifiedAt,
        // "password": password,
        // "remember_token": rememberToken,
        // "department_id": departmentId,
        // "ticketit_admin": ticketitAdmin,
        // "ticketit_agent": ticketitAgent,
        // "status": status,
        // "theme": theme,
        // "portal_language": portalLanguage,
        // "confirmation_code": confirmationCode,
        // "last_login_from": lastLoginFrom,
        // "hourly_rate": hourlyRate,
        // "is_user": isUser,
        // "color_theme": colorTheme,
        // "color_skin": colorSkin,
        // "ipos_token": iposToken,
        // "commission_on_product": commissionOnProduct,
        "type_Contact": typeContact,
        // "microsoft_token": microsoftToken,
        // "microsoft_refresh_token": microsoftRefreshToken,
        // "has_expired": hasExpired,
        // "payment_type": paymentType,
      };
}
