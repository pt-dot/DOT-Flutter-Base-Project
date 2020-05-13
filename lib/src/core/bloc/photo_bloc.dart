import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/repositories/api/photo_repository.dart';
import 'package:base_flutter/src/core/repositories/db/album_db_repository.dart';
import 'package:base_flutter/src/core/states/list_state.dart';
import 'package:rxdart/rxdart.dart';

class PhotoBloc {

  final PhotoRepository _repository = PhotoRepository();
  final AlbumDbRepository _dbRepository = AlbumDbRepository();

  final _albumSubject = BehaviorSubject<ListState<Album>>();

  Stream<ListState<Album>> get albumStream => _albumSubject.stream;

  Function(ListState<Album>) get updateAlbumStream => _albumSubject.sink.add;

  void getAlbumList({bool init = true}) async {

    if (init) { 
      if (_dbRepository.getAllAlbum().isEmpty) {
        updateAlbumStream(ListState.init());
      } else {
        updateAlbumStream(ListState.initWithData(_dbRepository.getAllAlbum()));
      }
    }

    int page = init ? 0 : _albumSubject.value.page + 1;
    List<Album> albumList = await fetchAlbumList(page * AppLimit.ALBUM_PAGE_SIZE);

    if (init) {
      updateAlbumStream(ListState.firstLoadSuccess(albumList));
      _dbRepository.replaceAlbums(albumList);
    } else {
      List<Album> tempAlbumList = _albumSubject.value.data;
      tempAlbumList.addAll(albumList);
      updateAlbumStream(ListState.loadMoreSuccess(tempAlbumList, page));
    }

  }

  Future<List<Album>> fetchAlbumList(int start) async {
    try {
      final ApiServiceModel<ListAlbum> albumApi = await _repository.getListAlbum(start);
      return albumApi.data.listAlbum;
    } catch (err) {
      if (start == 0) 
        updateAlbumStream(ListState.firstLoadError());
      else 
        updateAlbumStream(ListState.loadMoreError(_albumSubject.value.data, _albumSubject.value.page));
      rethrow;
    }
  }

}