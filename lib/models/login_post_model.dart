// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  int code;
  String message;
  Data data;

  Login({
    required this.code,
    required this.message,
    required this.data,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  dynamic firstName;
  dynamic lastName;
  dynamic thumbnail;
  dynamic phone1Code;
  dynamic phone1;
  dynamic phone2Code;
  dynamic phone2;
  String email;
  dynamic skype;
  dynamic address;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic companyId;
  dynamic city;
  dynamic stateRegion;
  dynamic zipPostalCode;
  dynamic taxId;
  dynamic groupId;
  dynamic countryId;
  dynamic deliveryAddress;
  dynamic currencyId;
  dynamic languageId;
  int ticketEmails;
  String name;
  dynamic fulladdress;
  dynamic emailVerifiedAt;
  dynamic departmentId;
  int ticketitAdmin;
  int ticketitAgent;
  String status;
  dynamic theme;
  String portalLanguage;
  dynamic confirmationCode;
  dynamic lastLoginFrom;
  dynamic hourlyRate;
  String isUser;
  dynamic colorTheme;
  String colorSkin;
  dynamic iposToken;
  dynamic commissionOnProduct;
  dynamic typeContact;
  List<String> permissions;
  String bearer;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.thumbnail,
    required this.phone1Code,
    required this.phone1,
    required this.phone2Code,
    required this.phone2,
    required this.email,
    required this.skype,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
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
    required this.ticketEmails,
    required this.name,
    required this.fulladdress,
    required this.emailVerifiedAt,
    required this.departmentId,
    required this.ticketitAdmin,
    required this.ticketitAgent,
    required this.status,
    required this.theme,
    required this.portalLanguage,
    required this.confirmationCode,
    required this.lastLoginFrom,
    required this.hourlyRate,
    required this.isUser,
    required this.colorTheme,
    required this.colorSkin,
    required this.iposToken,
    required this.commissionOnProduct,
    required this.typeContact,
    required this.permissions,
    required this.bearer,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        thumbnail: json["thumbnail"],
        phone1Code: json["phone1_code"],
        phone1: json["phone1"],
        phone2Code: json["phone2_code"],
        phone2: json["phone2"],
        email: json["email"],
        skype: json["skype"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        companyId: json["company_id"],
        city: json["city"],
        stateRegion: json["state_region"],
        zipPostalCode: json["zip_postal_code"],
        taxId: json["tax_id"],
        groupId: json["group_id"],
        countryId: json["country_id"],
        deliveryAddress: json["delivery_address"],
        currencyId: json["currency_id"],
        languageId: json["language_id"],
        ticketEmails: json["ticket_emails"],
        name: json["name"],
        fulladdress: json["fulladdress"],
        emailVerifiedAt: json["email_verified_at"],
        departmentId: json["department_id"],
        ticketitAdmin: json["ticketit_admin"],
        ticketitAgent: json["ticketit_agent"],
        status: json["status"],
        theme: json["theme"],
        portalLanguage: json["portal_language"],
        confirmationCode: json["confirmation_code"],
        lastLoginFrom: json["last_login_from"],
        hourlyRate: json["hourly_rate"],
        isUser: json["is_user"],
        colorTheme: json["color_theme"],
        colorSkin: json["color_skin"],
        iposToken: json["ipos_token"],
        commissionOnProduct: json["commission_on_product"],
        typeContact: json["type_contact"],
        permissions: List<String>.from(json["permissions"].map((x) => x)),
        bearer: json["Bearer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "thumbnail": thumbnail,
        "phone1_code": phone1Code,
        "phone1": phone1,
        "phone2_code": phone2Code,
        "phone2": phone2,
        "email": email,
        "skype": skype,
        "address": address,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
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
        "ticket_emails": ticketEmails,
        "name": name,
        "fulladdress": fulladdress,
        "email_verified_at": emailVerifiedAt,
        "department_id": departmentId,
        "ticketit_admin": ticketitAdmin,
        "ticketit_agent": ticketitAgent,
        "status": status,
        "theme": theme,
        "portal_language": portalLanguage,
        "confirmation_code": confirmationCode,
        "last_login_from": lastLoginFrom,
        "hourly_rate": hourlyRate,
        "is_user": isUser,
        "color_theme": colorTheme,
        "color_skin": colorSkin,
        "ipos_token": iposToken,
        "commission_on_product": commissionOnProduct,
        "type_contact": typeContact,
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
        "Bearer": bearer,
      };
}
