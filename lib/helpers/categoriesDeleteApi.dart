// ignore_for_file: file_names, avoid_print
import 'package:crm_new/resources/components/app_url.dart';
import 'package:http/http.dart' as http;

Future<http.Response> deleteCategory(int id) async {
  String token = AppUrl.token;
  var headers = {
    //'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var url = Uri.parse(
      'https://testcrm.thesuperstarshop.com/api/v1/product-category/$id');

  var request = http.Request('DELETE', url);

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print('Category Deleted Successfully.');
  } else {
    print('Failed to delete category: ${response.reasonPhrase}');
  }

  return await http.Response.fromStream(response);
}
