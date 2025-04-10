import 'dart:convert';
import 'package:get/get.dart';
import '../../core/values/localization/local_keys.dart';
import 'app_exception.dart';

class NetworkException extends AppException {
  final Response _networkResponse;
  int? get statusCode => _networkResponse.statusCode;

  NetworkException(this._networkResponse)
      : super(
          _networkResponse.statusText,
        );

  @override
  String toString() {
    String errorMessage;
    if (_networkResponse.bodyString?.isNotEmpty ?? false) {
      final Map<String, dynamic> responseJson =
          jsonDecode(_networkResponse.bodyString!);
      if (responseJson.containsKey('message')) {
        errorMessage = responseJson['message'];
      } else {
        errorMessage = LocalKeys.kGenericErrorMessage;
      }
    } else {
      errorMessage = LocalKeys.kGenericErrorMessage;
    }
    return errorMessage;
  }
}
