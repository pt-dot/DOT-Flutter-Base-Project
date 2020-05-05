import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/core/data/constants.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final NetworkHelper _networkHelper = NetworkHelper();

  Future<ListPost> getListPost(int start) async {
    final Response<dynamic> response = await  _networkHelper.get('posts?_start=$start&limit=${AppLimit.ALBUM_PAGE_SIZE}') as Response<dynamic>;
    return ListPost.fromJson(response.data as List<dynamic>);
  }

}