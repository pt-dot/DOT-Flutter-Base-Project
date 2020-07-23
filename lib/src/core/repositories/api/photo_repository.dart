import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/data/constants.dart';
import 'package:dio/dio.dart';

class PhotoRepository {
  final NetworkHelper _networkHelper;

  PhotoRepository(this._networkHelper);

  Future<ApiServiceModel<ListAlbum>> getListAlbum(int start) async {
    final Response<dynamic> response = await _networkHelper
            .get('albums?_start=$start&_limit=${AppLimit.ALBUM_PAGE_SIZE}')
        as Response<dynamic>;
    return ApiServiceModel.fromList(response, ListAlbum.fromJson);
  }
}
