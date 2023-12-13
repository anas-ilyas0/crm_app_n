import 'dart:io';

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name, email, address, contactType;
  String receivedData;
  File? image;
  bool dataAvailable = false;

  UserProvider({
    this.name = '',
    this.email = '',
    this.address = '',
    this.contactType = '',
    this.receivedData = '',
    this.image,
  });

  void changeData({
    required String newName,
    required String newEmail,
    required String newAddress,
    required String newContactType,
    required File? newImage,
  }) async {
    name = newName;
    email = newEmail;
    address = newAddress;
    contactType = newContactType;
    image = newImage;
    dataAvailable = true;
    notifyListeners();
  }
}
