import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/models/album_model.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:dio/dio.dart';

class PhotoRepository {
  final NetworkHelper _networkHelper;

  PhotoRepository(this._networkHelper);

  Future<ApiServiceModel<ListAlbum>> getListAlbum(int page) async {
    final params = {
      '_page': page,
      '_limit': Constants.ALBUM_PAGE_SIZE,
    };
    final Response<dynamic> response =
        await _networkHelper.get('albums', query: params) as Response<dynamic>;
    return ApiServiceModel.fromList(response, ListAlbum.fromJson);
  }
}
