// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> updateTax(
    int id, String newTaxName, String newRate, String newRateType) async {
  String token = AppUrl.token;
  String taxesUrl = AppUrl.editTaxesUrl;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var request = http.Request('POST', Uri.parse(taxesUrl));
  request.body = json.encode({
    "created_by": id,
    'id': id,
    "name": newTaxName,
    "rate": newRate,
    "rate_type": newRateType
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  return await http.Response.fromStream(response);
}
