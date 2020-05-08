import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/repositories/api/photo_repository.dart';
import 'package:rxdart/rxdart.dart';

class PhotoBloc {

  final PhotoRepository _appRepository = PhotoRepository();

  final _listAlbumSubject = BehaviorSubject<List<Album>>.seeded([]);

  void getAlbumList() async {

  }
  

  Future<List<Album>> fetchAlbumList(int start) async {
    try {
      final ApiServiceModel<ListAlbum> albumApi = await _appRepository.getListAlbum(start);
      return albumApi.data.listAlbum;
    } catch (err) {
      rethrow;
    }
  }

}