import 'package:base_flutter/src/data/constants.dart';
import 'package:base_flutter/src/models/Post.dart';
import 'package:base_flutter/src/models/album.dart';
import 'package:base_flutter/src/networks/network_helper.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final NetworkHelper _networkHelper = NetworkHelper();

  Future<ListPost> getListPost(int start) async {
    print('post_repo');
    final Response<dynamic> response = await  _networkHelper.get('posts?_start=$start&limit=${AppLimit.ALBUM_PAGE_SIZE}') as Response<dynamic>;
    return ListPost.fromJson(response.data as List<dynamic>);
  }

}