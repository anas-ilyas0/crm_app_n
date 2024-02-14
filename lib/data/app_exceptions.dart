// ignore_for_file: prefer_typing_uninitialized_variables

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message' '$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Comunication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? prefix])
      : super(message, 'Invalid Request'); //Route not exist
}

class UnauthirizedException extends AppException {
  UnauthirizedException([String? message])
      : super(message, 'Unauthirized Request'); //Token not correct
}

class InvaliInputException extends AppException {
  InvaliInputException([String? message]) : super(message, 'Invalid Input');
}
