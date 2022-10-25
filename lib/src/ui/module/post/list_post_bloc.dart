import 'package:base_flutter/src/core/repositories/api/post_repository.dart';
import 'package:base_flutter/src/core/repositories/db/post_db_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../../../core/networks/network_helper.dart';
import 'list_post_event.dart';
import 'list_post_state.dart';

class ListPostBloc extends Bloc<ListPostEvent, ListPostState> {
  PostRepository? _repository;
  final PostDbRepository _dbRepository = PostDbRepository();

  ListPostBloc() : super(const ListPostState()) {
    _repository = PostRepository(NetworkHelper());
    on<InitListPostEvent>(_onInit);
    on<LoadListPostEvent>(_onDataRequest);
  }

  void _onInit(InitListPostEvent event, Emitter<ListPostState> emit) {
    add(LoadListPostEvent());
  }

  Future<void> _onDataRequest(
      LoadListPostEvent event, Emitter<ListPostState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final result = await _repository?.getListPost(event.page);
      final items = result?.data?.listPost ?? [];
      final allItems = event.page < 2 ? items : state.post + items;

      /// save to local
      _dbRepository.replacePosts(allItems);

      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        post: allItems,
        page: event.page,
      ));
    } catch (e) {
      if (event.page == 1) {
        final items = _dbRepository.getAllPost();
        emit(state.copyWith(
          post: items,
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
