// ignore_for_file: file_names, prefer_interpolation_to_compose_strings
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:crm_new/data/app_exceptions.dart';
import 'package:crm_new/data/network/baseApiServices.dart';

class NetWorkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final res =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response res = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response responce) {
    switch (responce.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(responce.body);
        return responseJson;
      case 400:
        throw BadRequestException(responce.body.toString());
      case 401:
        throw BadRequestException(responce.body.toString());
      case 404:
        throw UnauthirizedException(responce.body.toString());
      case 500:
        throw FetchDataException(
            'Internal Server Error ' + responce.statusCode.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server with Status Code' +
                responce.statusCode.toString());
    }
  }
}
