import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final NetworkHelper _networkHelper;

  PostRepository(this._networkHelper);

  Future<ApiServiceModel<ListPost>> getListPost(int page) async {
    final params = {
      '_page': page,
      '_limit': AppLimit.POST_PAGE_SIZE,
    };
    final Response<dynamic> response =
        await _networkHelper.get('posts', query: params) as Response<dynamic>;
    return ApiServiceModel.fromList(response, ListPost.fromJson);
  }
}
