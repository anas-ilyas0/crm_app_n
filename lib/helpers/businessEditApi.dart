// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> updateBusiness(int id, String newName) async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var request = http.Request('POST',
      Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/business-edit'));
  request.body =
      json.encode({"created_by": id, 'id': id, "business_name": newName});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  return await http.Response.fromStream(response);
}
