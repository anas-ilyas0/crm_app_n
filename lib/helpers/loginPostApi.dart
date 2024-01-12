// ignore_for_file: file_names, avoid_print

import 'package:http/http.dart' as http;

Future<http.Response> performLogin(String email, String password) async {
  var headers = {'Accept': 'application/json'};

  var request = http.MultipartRequest(
      'POST', Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/login'));
  request.fields.addAll({'email': email, 'password': password});
  print('request.fields : ${request.fields}');

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return await http.Response.fromStream(response);
}
