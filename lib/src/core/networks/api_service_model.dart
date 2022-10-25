import 'package:base_flutter/src/core/networks/app_exceptions.dart';
import 'package:dio/dio.dart';

enum Status { LOADING, COMPLETED, LOADED_ALL, ERROR, DIOERROR }

class ApiServiceModel<T> {
  ApiServiceModel.loading(this.data) : status = Status.LOADING;
  ApiServiceModel.completed(this.data) : status = Status.COMPLETED;
  ApiServiceModel.error(this.data) : status = Status.ERROR;

  ApiServiceModel.fromResponse(
      Response response, T Function(Map<String, dynamic>) fromJson) {
    // response will be different from API, adjusted from current API
    final dataResponse = response.data as Map<String, dynamic>;
    if (response.statusCode == 200 ||
        response.statusCode == 201 && dataResponse['success'] as bool) {
      message = dataResponse['message'] != null
          ? dataResponse['message'] as String
          : null;
      data = fromJson(dataResponse);
      status = Status.COMPLETED;
    } else {
      throw BusinessException.fromJson(dataResponse);
    }
  }

  ApiServiceModel.fromResponseForList(
      Response response, T Function(List) fromJson) {
    final dataResponse = response.data as Map<String, dynamic>;
    if (response.statusCode == 200 && dataResponse['success'] as bool) {
      message = dataResponse['message'] as String;
      data = fromJson(dataResponse['data'] as List);
      status = Status.COMPLETED;
    } else {
      throw BusinessException.fromJson(dataResponse);
    }
  }

  ApiServiceModel.fromResponseList(
      Response response, T Function(List) fromJson) {
    final dataResponse = response.data as Map<String, dynamic>;
    if (response.statusCode == 200) {
      message = 'Success';
      data = fromJson(dataResponse as List);
      status = Status.COMPLETED;
    } else {
      throw BusinessException.fromJson(dataResponse);
    }
  }

  ApiServiceModel.fromResponseForString(Response response) {
    final dataResponse = response.data as Map<String, dynamic>;
    if (response.statusCode == 200) {
      message = 'Success';
      data = dataResponse['data'] as T;
      status = Status.COMPLETED;
    } else {
      throw BusinessException.fromJson(dataResponse);
    }
  }

  ApiServiceModel.fromList(
      Response response, T Function(List<dynamic>) fromJson) {
    final dataResponse = response.data as List<dynamic>;
    if (response.statusCode == 200) {
      message = 'Success';
      data = fromJson(dataResponse);
      status = Status.COMPLETED;
    } else {}
  }

  Status? status;
  T? data;
  String? message;
  AppException? error;
}
