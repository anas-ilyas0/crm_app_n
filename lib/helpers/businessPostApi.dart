//ignore_for_file: file_names, avoid_print

import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> sendPostRequest(String businessName) async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var request = http.MultipartRequest('POST',
      Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/business'));
  request.fields.addAll({'business_name': businessName, 'created_by': '1'});
  print('request.fields : ${request.fields}');

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return await http.Response.fromStream(response);
}
