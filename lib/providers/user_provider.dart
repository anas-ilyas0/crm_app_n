import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name, email, address, contactType;
  String receivedData;
  bool dataAvailable = false;

  UserProvider({
    this.name = '',
    this.email = '',
    this.address = '',
    this.contactType = '',
    this.receivedData = '',
  });

  void changeData({
    required String newName,
    required String newEmail,
    required String newAddress,
    required String newContactType,
  }) async {
    name = newName;
    email = newEmail;
    address = newAddress;
    contactType = newContactType;
    dataAvailable = true;
    notifyListeners();
  }
}
