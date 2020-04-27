import 'package:base_flutter/src/data/constants.dart';
import 'package:base_flutter/src/utils/app_helper.dart';
import 'package:base_flutter/src/networks/logging_interceptor.dart';
import 'package:dio/dio.dart';

class NetworkHelper {

  NetworkHelper() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: TIME_OUT,
      receiveTimeout: TIME_OUT,
      sendTimeout: TIME_OUT,
    ));
    if (isInDebugMode) {
      _dio.interceptors.add(LoggingInterceptor());
    }
  }

  Dio _dio;

  Future<dynamic> get(String url) async {
    dynamic response;
    try {
      response = await _dio.get<dynamic>(url);
    } catch(err) {
      rethrow;
    }
    return response;
  }

}