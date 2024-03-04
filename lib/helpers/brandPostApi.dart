//ignore_for_file: file_names, avoid_print
import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> brandPostRequest(String title, String status) async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var request = http.MultipartRequest(
      'POST', Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/brand'));
  request.fields.addAll({'title': title, 'status': status, 'created_by': '1'});
  // if (iconFile != null) {
  //   request.files.add(await http.MultipartFile.fromPath(
  //     'icon',
  //     iconFile.path,
  //   ));
  // }
  print('request.fields : ${request.fields}');

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return await http.Response.fromStream(response);
}
