// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> updateDiscount(int id, String newDiscountName,
    String newDiscount, String newDiscountType) async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var request = http.Request('POST',
      Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/update-discount'));
  request.body = json.encode({
    "created_by": id,
    'id': id,
    "name": newDiscountName,
    "discount": newDiscount,
    "discount_type": newDiscountType
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  return await http.Response.fromStream(response);
}
