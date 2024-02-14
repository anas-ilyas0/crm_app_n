import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void flushBarErrorMessage(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(8),
          duration: const Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          title: 'Error',
          message: message,
          messageColor: Colors.white,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          forwardAnimationCurve: Curves.decelerate,
          icon: const Icon(Icons.error, size: 28, color: Colors.white),
        )..show(context));
  }

  static showSnackbar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(text),
      ),
    );
  }
}
