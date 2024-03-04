// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> leadPostRequest(
  String firstName,
  String lastName,
  //String contactType,
  String email,
  String address,
  String group,
  String phone1,
  String phone2,
  String skype,
  String city,
  String state,
  String zip,
  String taxID,
  String language,
) async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var body = json.encode({
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "address": address,
    "contact_type": 11, // Assuming this should be a single value
    "language": 1, // Assuming this should be a single value
    "currency_id": 6, // Assuming this should be a single value
    "phone1": phone1,
    "phone2": phone2,
    "group_id": group,
    "skype": skype,
    "city": city,
    "state_region": state,
    "zip_postal_code": zip,
    "tax_id": taxID,
    "language_id": language,
    "selectedid": 7, // Assuming this should be a single value
  });

  var request = http.Request(
      'POST', Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/leads'));
  request.body = body;
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return await http.Response.fromStream(response);
}
