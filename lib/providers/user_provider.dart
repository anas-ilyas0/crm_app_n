import 'dart:io';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String name, email, address, contactType;
  String receivedData;
  File? image;
  bool dataAvailable = false;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserProvider({
    this.name = '',
    this.email = '',
    this.address = '',
    this.contactType = '',
    this.receivedData = '',
    this.image,
  });

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

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
