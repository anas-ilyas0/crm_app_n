// ignore_for_file: file_names, avoid_print

import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> discountPostRequest(
    String discountName, String discount, String discountType) async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var request = http.MultipartRequest('POST',
      Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/discounts'));
  request.fields.addAll({
    'name': discountName,
    'discount': discount,
    'discount_type': discountType,
    'created_by': '1'
  });
  print('request.fields : ${request.fields}');

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return await http.Response.fromStream(response);
}
