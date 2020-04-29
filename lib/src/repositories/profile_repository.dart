import 'package:base_flutter/src/models/user.dart';
import 'package:base_flutter/src/networks/network_helper.dart';
import 'package:dio/dio.dart';

class ProfileRepository {

  final NetworkHelper _networkHelper = NetworkHelper();

  Future<User> getUser(int id) async {
    final Response<dynamic> response = await _networkHelper.get('users/$id') as Response<dynamic>;
    return User.fromJson(response.data);
  }

}