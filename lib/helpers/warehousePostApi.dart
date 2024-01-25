// ignore_for_file: file_names, avoid_print

import 'package:http/http.dart' as http;

Future<http.Response> warehousePostRequest(
    String warehouseName, String address) async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTQ3YTdkMDA0NmFlNWEzNTNiYWQ5MjRkMjU4ZjVhNmMxZDUxYzBlMDhkMzdhMWU1ZWZiNzZkYWQ1NDY4Nzc1MGM1MjgyZjkzYTllNmYzY2QiLCJpYXQiOjE3MDU5MzMwNjcuODEzODY4OTk5NDgxMjAxMTcxODc1LCJuYmYiOjE3MDU5MzMwNjcuODEzODcyMDk4OTIyNzI5NDkyMTg3NSwiZXhwIjoxNzM3NTU1NDY3LjE5MTE1ODA1NjI1OTE1NTI3MzQzNzUsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.Io6T_3JtEIyghYAAOZqiCZsd6eqjvk11l3wR1PiqG0r48VPd49Z-I99SJP34cTsag1IP5sINWt3O9Q_jEAtXRWAeBXUHuBsLYAhRRm8gYkN8uUuliWhFkBHjxhLGw2ErYeP6x7_QJ2a8qMNEWdRXHiSXebIrkJO-X986UcJDH7iLNsHrOcSV0Be_xZpQhRD628XLfjvQv691OcBKciSXHvwM1pRAwG6BD9kkqlJPJbAskOY5HB1i16hM-wySy2ta6u7AhvhLS73mlBpJpgYdYmpvYwrkPvHAQE9zuIkrNa7Sfcca99XJZ1eWDZqvbW15kgf6o_IrJ9HEI7sIiu-o-Edn2NckPaVdgDDguS5Q6-jxEGR8Q7ChMwzZMZ5CXJ09TvfRrlbdAWGKQByNkVJ9Q1JM_0G9218scnWJxtNouSxxCdtP8cX_NtCIWHqXLKwfiF7ss2V84e4zob2tYph5RfpGN4yM7I-nBdU6EQfPy2LCTD-QIUOuX-cp9OwMjDakm6YYKMeSM0eTXz7U88h8HdjF3tK7c6AMlt7kkIb_JAaaJMnvqxWxRVeQviehjgMBsScIOT043l1z42H3HFM-JPI09DH2ZhXboboGSUGrXK2WGQAvNSuVD3AZjtu9hlbEqVN4OKzjjMIqzveVvacaBDYmybU_X8sVGyes0KHJVnU'
  };

  var request = http.MultipartRequest('POST',
      Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/warehouses'));
  request.fields
      .addAll({'name': warehouseName, 'address': address, 'created_by': '1'});
  print('request.fields : ${request.fields}');

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  return await http.Response.fromStream(response);
}
