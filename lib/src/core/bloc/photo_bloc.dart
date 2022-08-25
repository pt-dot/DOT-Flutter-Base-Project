import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/repositories/api/photo_repository.dart';
import 'package:base_flutter/src/core/repositories/db/album_db_repository.dart';
import 'package:base_flutter/src/core/states/list_state.dart';
import 'package:rxdart/rxdart.dart';

class PhotoBloc {
  final PhotoRepository _repository;
  final AlbumDbRepository _dbRepository = AlbumDbRepository();

  final _albumSubject = BehaviorSubject<ListState<Album>>();

  Stream<ListState<Album>> get albumStream => _albumSubject.stream;

  Function(ListState<Album>) get updateAlbumStream => _albumSubject.sink.add;

  PhotoBloc(this._repository);

  /// Get album list from fetchPostList method & update to stream.
  /// Set [init] to true for first load.
  void getAlbumList({bool init = true}) async {
    int page = init ? 0 : _albumSubject.value.page ?? 0 + 1;
    List<Album>? tempAlbumList;

    /// SET DATA STATE
    /// first load
    if (init) {
      /// if local data was empty, set data state to FIRST_LOAD
      if (_dbRepository.getAllAlbum().isEmpty) {
        updateAlbumStream(ListState.init());

        /// if local data was not empty,  set data state to FIRST_LOAD_WITH_INIT_DATA
      } else {
        updateAlbumStream(ListState.initWithData(_dbRepository.getAllAlbum()));
      }

      /// load more
    } else {
      tempAlbumList = _albumSubject.value.data!;
      updateAlbumStream(ListState.loadMore(tempAlbumList, page));
    }

    /// FETCH POST LIST
    List<Album> albumList =
        await fetchAlbumList(page * AppLimit.ALBUM_PAGE_SIZE);

    /// if fetched post list was empty, set data state to LOADED_ALL
    if (albumList.isEmpty) {
      updateAlbumStream(ListState.loadedAll(tempAlbumList, page - 1));

      /// if first load, set data state to LOADED and replace local data with fetched data
    } else if (init) {
      updateAlbumStream(ListState.firstLoadSuccess(albumList));
      _dbRepository.replaceAlbums(albumList);

      /// if load more, add fetched data to existed data
    } else {
      tempAlbumList?.addAll(albumList);
      updateAlbumStream(ListState.loadMoreSuccess(tempAlbumList, page));
    }
  }

  /// fetch album list from API
  Future<List<Album>> fetchAlbumList(int start) async {
    try {
      final ApiServiceModel<ListAlbum> albumApi =
          await _repository.getListAlbum(start);
      return albumApi.data?.listAlbum ?? [];
    } catch (err) {
      /// if first load error
      if (start == 0)
        updateAlbumStream(ListState.firstLoadError());

      /// if load more error
      else
        updateAlbumStream(ListState.loadMoreError(
            _albumSubject.value.data, _albumSubject.value.page ?? 1 - 1));
      rethrow;
    }
  }
}
