import 'package:base_flutter/src/models/album.dart';
import 'package:base_flutter/src/repositories/app_repository.dart';

class PhotoBloc {

  final AppRepository _appRepository = AppRepository();

  Future<List<Album>> getListAlbum(int start) async {
    try {
      final ListAlbum listAlbum = await _appRepository.getListAlbum(start);
      return listAlbum.listAlbum;
    } catch (err) {
      rethrow;
    }
  }

}