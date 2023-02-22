import 'package:base_flutter/src/ui/module/photo/list_photo_event.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_state.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../../../core/networks/network_helper.dart';
import '../../../core/repositories/api/photo_repository.dart';
import '../../../core/repositories/db/album_db_repository.dart';

class ListPhotoBloc extends Bloc<ListPhotoEvent, ListPhotoState> {
  PhotoRepository? _repository;
  final AlbumDbRepository _dbRepository = AlbumDbRepository();

  ListPhotoBloc() : super(const ListPhotoState()) {
    _repository = PhotoRepository(NetworkHelper());
    on<InitListPhotoEvent>(_onInit);
    on<LoadListPhotoEvent>(_onDataRequest);
  }

  void _onInit(InitListPhotoEvent event, Emitter<ListPhotoState> emit) {
    add(LoadListPhotoEvent());
  }

  Future<void> _onDataRequest(
      LoadListPhotoEvent event, Emitter<ListPhotoState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final result = await _repository?.getListAlbum(event.page);
      final items = result?.data?.listAlbum ?? [];
      final allItems = event.page < 2 ? items : state.albums + items;

      /// save to local
      _dbRepository.replaceAlbums(allItems);

      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        albums: allItems,
        page: event.page,
      ));
    } catch (e) {
      if (event.page == 1) {
        final items = _dbRepository.getAllAlbum();
        emit(state.copyWith(
          albums: items,
          status: FormzStatus.submissionFailure,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
