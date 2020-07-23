import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/core/data/constants.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final NetworkHelper _networkHelper;

  PostRepository(this._networkHelper);

  Future<ApiServiceModel<ListPost>> getListPost(int start) async {
    final Response<dynamic> response = await _networkHelper
            .get('posts?_start=$start&limit=${AppLimit.POST_PAGE_SIZE}')
        as Response<dynamic>;
    return ApiServiceModel.fromList(response, ListPost.fromJson);
  }
}
