import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/repositories/api/photo_repository.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_event.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_state.dart';
import 'package:bloc/bloc.dart';

class ListPhotoBloc extends Bloc<ListPhotoEvent, ListPhotoState> {
  PhotoRepository? _repository;

  ListPhotoBloc() : super(const ListPhotoState()) {
    _repository = PhotoRepository(NetworkHelper());
    on<InitListPhotoEvent>(_onInit);
  }

  void _onInit(InitListPhotoEvent event, Emitter<ListPhotoState> emit) {

  }
}
