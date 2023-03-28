import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/networks/logging_interceptor.dart';
import 'package:base_flutter/src/utils/app_helper.dart';
import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper() {
    _options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: Duration(seconds: Constants.REQUEST_TIME_OUT),
      receiveTimeout: Duration(seconds: Constants.REQUEST_TIME_OUT),
      sendTimeout: Duration(seconds: Constants.REQUEST_TIME_OUT),
    );
    _dio = Dio(_options);
    if (isInDebugMode) {
      _dio.interceptors.add(LoggingInterceptor());
    }
  }

  late Dio _dio;
  late BaseOptions _options;

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    dynamic response;
    try {
      response = await _dio.get<dynamic>(url, queryParameters: query);
    } catch (err) {
      rethrow;
    }
    return response;
  }
}
