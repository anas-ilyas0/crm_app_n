import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name, email, contactInfo, currency;

  UserProvider({
    this.name = '',
    this.email = '',
    this.contactInfo = '',
    this.currency = '',
  });

  void changeData({
    required String newName,
    required String newEmail,
    required String newContactInfo,
    required String newCurrency,
  }) async {
    name = newName;
    email = newEmail;
    contactInfo = newContactInfo;
    currency = newCurrency;
    notifyListeners();
  }
}
