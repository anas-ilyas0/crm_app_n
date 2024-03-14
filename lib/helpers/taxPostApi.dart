// ignore_for_file: file_names, avoid_print

import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> taxPostRequest(
    String taxName, String rate, String rateType) async {
  String token = AppUrl.token;
  String taxesUrl = AppUrl.taxesUrl;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var request = http.MultipartRequest('POST', Uri.parse(taxesUrl));
  request.fields.addAll({
    'name': taxName,
    'rate': rate,
    'rate_type': rateType,
    'created_by': '1'
  });
  print('request.fields : ${request.fields}');

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return await http.Response.fromStream(response);
}
