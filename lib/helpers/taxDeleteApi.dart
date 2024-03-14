// ignore_for_file: file_names, avoid_print
import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> deleteTax(int id) async {
  String token = AppUrl.token;
  String taxesUrl = AppUrl.taxesUrl;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var url = Uri.parse('$taxesUrl/$id');

  var request = http.Request('DELETE', url);

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print('Tax Deleted Successfully.');
  } else {
    print('Failed to delete tax: ${response.reasonPhrase}');
  }

  return await http.Response.fromStream(response);
}
