import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/repositories/api/photo_repository.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_event.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_state.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ListPhotoBloc extends Bloc<ListPhotoEvent, ListPhotoState> {
  PhotoRepository? _repository;

  ListPhotoBloc() : super(const ListPhotoState()) {
    _repository = PhotoRepository(NetworkHelper());
    on<ListPhotoInitEvent>(
      _onInit,
      transformer: throttleDroppable(
        throttleDuration,
      ),
    );
    on<ListPhotoRefreshEvent>(_onRefresh);
  }

  void _onInit(ListPhotoInitEvent event, Emitter<ListPhotoState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == AlbumStatus.initial) {
        final response = await _repository?.getListAlbum(state.page);
        final albums = response?.data?.listAlbum ?? [];
        emit(state.copyWith(
          status: AlbumStatus.success,
          albums: albums,
          hasReachedMax: false,
        ));
      }
      int nextPage = state.page + 1;
      emit(state.copyWith(
        page: nextPage,
      ));
      final response = await _repository?.getListAlbum(state.page);
      final albums = response?.data?.listAlbum ?? [];
      if (albums.isEmpty) {
        emit(state.copyWith(
          status: AlbumStatus.success,
          hasReachedMax: true,
        ));
      } else {
        emit(state.copyWith(
          status: AlbumStatus.success,
          albums: List.of(state.albums)..addAll(albums),
          hasReachedMax: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AlbumStatus.failure,
      ));
    }
  }

  void _onRefresh(ListPhotoRefreshEvent event, Emitter<ListPhotoState> emit) {
    emit(state.copyWith(
      status: AlbumStatus.initial,
      page: 1,
      hasReachedMax: false,
      albums: [],
    ));
    add(ListPhotoInitEvent());
  }
}
