import 'package:base_flutter/src/core/data/models/user.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:dio/dio.dart';

class ProfileRepository {
  final NetworkHelper _networkHelper;

  ProfileRepository(this._networkHelper);

  Future<ApiServiceModel<User>> getUser(int id) async {
    final Response<dynamic> response =
        await _networkHelper.get('users/$id') as Response<dynamic>;
    final user = ApiServiceModel.fromResponse(response, User.fromJson);
    return user;
  }
}
