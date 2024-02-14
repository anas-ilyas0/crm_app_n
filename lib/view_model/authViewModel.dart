// ignore_for_file: file_names

import 'package:crm_new/repositories/auth_repo.dart';
import 'package:crm_new/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    //setLoading(true);
    _myRepo.loginApi(data).then((value) {
      //setLoading(false);
      Utils.flushBarErrorMessage(context, value.toString());
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      //setLoading(false);
      Utils.flushBarErrorMessage(context, error.toString());

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  @override
  notifyListeners();
}
