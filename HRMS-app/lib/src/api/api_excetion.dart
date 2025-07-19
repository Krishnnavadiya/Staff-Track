import 'package:hrms/src/utils/utils.dart';

class ApiException implements Exception {
  String message;
  ApiException(this.message) {
    AppSnackbar.showErrorSnackbar(title: 'Error', message: message);
  }
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message);
}

class NetworkException extends ApiException {
  NetworkException(super.message);
}
