import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/repositories/api/post_repository.dart';
import 'package:base_flutter/src/ui/module/post/list_post_event.dart';
import 'package:base_flutter/src/ui/module/post/list_post_state.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ListPostBloc extends Bloc<ListPostEvent, ListPostState> {
  PostRepository? _repository;

  ListPostBloc() : super(const ListPostState()) {
    _repository = PostRepository(NetworkHelper());
    on<ListPostInitEvent>(
      _onInit,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ListPostRefreshEvent>(_onRefresh);
  }

  void _onInit(ListPostInitEvent event, Emitter<ListPostState> emit) async {
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

  void _onRefresh(ListPostRefreshEvent event, Emitter<ListPostState> emit) {
    emit(state.copyWith(
      status: PostStatus.initial,
      page: 1,
      hasReachedMax: false,
      posts: [],
    ));
    add(ListPostInitEvent());
  }
}
