import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/repositories/api/post_repository.dart';
import 'package:base_flutter/src/core/repositories/db/post_db_repository.dart';
import 'package:base_flutter/src/ui/module/post/list_post_event.dart';
import 'package:base_flutter/src/ui/module/post/list_post_state.dart';
import 'package:bloc/bloc.dart';

class ListPostBloc extends Bloc<ListPostEvent, ListPostState> {
  PostRepository? _repository;
  final PostDbRepository _dbRepository = PostDbRepository();

  ListPostBloc() : super(const ListPostState()) {
    _repository = PostRepository(NetworkHelper());
    on<InitListPostEvent>(_onInit);
  }

  void _onInit(InitListPostEvent event, Emitter<ListPostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final response = await _repository?.getListPost(state.page);
        final posts = response?.data?.listPost ?? [];
        emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        ));
      }
      int nextPage = state.page + 1;
      emit(state.copyWith(
        page: nextPage,
      ));
      final response = await _repository?.getListPost(state.page);
      final posts = response?.data?.listPost ?? [];
      if (posts.isEmpty) {
        emit(state.copyWith(
          status: PostStatus.success,
          hasReachedMax: true,
        ));
      } else {
        emit(state.copyWith(
          status: PostStatus.success,
          hasReachedMax: false,
          posts: List.of(state.posts)..addAll(posts),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: PostStatus.failure,
      ));
    }
  }
}
