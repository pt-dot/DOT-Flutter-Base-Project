import 'dart:convert';

import 'package:dio/dio.dart';

class AppException {
  AppException({this.dioError});
  final DioError? dioError;

  @override
  String toString() {
    return 'AppException :\n' +
        jsonEncode({
          'message': dioError?.message,
          'request': dioError?.error.toString(),
          'response': dioError?.response.toString(),
        });
  }
}

class UnknownException {
  UnknownException({this.message});
  final String? message;
}

class BusinessException {
  BusinessException({this.errorCode, this.errors, this.message});
  factory BusinessException.fromJson(Map<String, dynamic> json) =>
      BusinessException(
          errorCode: json['error-code'] as int,
          errors: json['errors'] as Map<String, dynamic>,
          message: json['message'] as String);
  final int? errorCode;
  final Map<String, dynamic>? errors;
  final String? message;

  @override
  String toString() {
    return 'Business Exception :\n' +
        jsonEncode(
            {'errorCode': errorCode, 'message': message, 'errors': errors});
  }

  String errorMessage() {
    var message = StringBuffer();
    errors?.forEach((_, dynamic value) {
      message.write(value.join(', '));
    });
    return message.toString();
  }
}
