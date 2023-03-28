import 'package:base_flutter/src/core/models/user_model.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:dio/dio.dart';

class ProfileRepository {
  final NetworkHelper _networkHelper;

  ProfileRepository(this._networkHelper);

  Future<ApiServiceModel<UserModel>> getUser(int id) async {
    final Response<dynamic> response =
        await _networkHelper.get('users/$id') as Response<dynamic>;
    final user = ApiServiceModel.fromResponse(response, UserModel.fromJson);
    return user;
  }
}
