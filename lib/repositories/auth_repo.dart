// ignore_for_file: use_rethrow_when_possible, avoid_print

import 'package:crm_new/data/network/baseApiServices.dart';
import 'package:crm_new/data/network/networkApiServices.dart';
import 'package:crm_new/resources/components/app_url.dart';

class AuthRepository {
  final BaseApiService _apiServices = NetWorkApiService();
  var loginURL = AppUrl.loginURL;
  //var signUpURL = AppUrl.loginURL;

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic res = await _apiServices.getPostApiResponse(loginURL, data);
      return res;
    } catch (e) {
      throw e;
    }
  }

  // Future<dynamic> registerApi(dynamic data) async {
  //   try {
  //     dynamic res = await _apiServices.getPostApiResponse(signUpURL, data);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }
}
