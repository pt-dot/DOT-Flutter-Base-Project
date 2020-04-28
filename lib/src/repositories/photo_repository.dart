import 'package:base_flutter/src/data/constants.dart';
import 'package:base_flutter/src/models/album.dart';
import 'package:base_flutter/src/networks/network_helper.dart';
import 'package:dio/dio.dart';

class PhotoRepository {

  final NetworkHelper _networkHelper = NetworkHelper();

  Future<ListAlbum> getListAlbum(int start) async {
    final Response<dynamic> response = await _networkHelper.get('albums?_start=$start&_limit=${AppLimit.ALBUM_PAGE_SIZE}') as Response<dynamic>;
    return ListAlbum.fromJson(response.data as List<dynamic>);
  }

}