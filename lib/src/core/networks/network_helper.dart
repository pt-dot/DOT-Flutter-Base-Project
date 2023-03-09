import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/networks/logging_interceptor.dart';
import 'package:base_flutter/src/utils/app_helper.dart';
import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper() {
    _dio = Dio(BaseOptions(
      baseUrl: URLs.host,
      connectTimeout: Duration(milliseconds: AppLimit.REQUEST_TIME_OUT),
      receiveTimeout: Duration(milliseconds: AppLimit.REQUEST_TIME_OUT),
      sendTimeout: Duration(milliseconds: AppLimit.REQUEST_TIME_OUT),
    ));
    if (isInDebugMode) {
      _dio?.interceptors.add(LoggingInterceptor());
    }
  }

  Dio? _dio;

  Future<dynamic> get(String url) async {
    dynamic response;
    try {
      response = await _dio?.get<dynamic>(url);
    } catch (err) {
      rethrow;
    }
    return response;
  }
}
