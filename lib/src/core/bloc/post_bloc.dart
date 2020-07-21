import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/repositories/api/post_repository.dart';
import 'package:base_flutter/src/core/repositories/db/post_db_repository.dart';
import 'package:base_flutter/src/core/states/list_state.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc {
  final PostRepository _repository = PostRepository();
  final PostDbRepository _dbRepository = PostDbRepository();

  final _postSubject = BehaviorSubject<ListState<Post>>();

  Stream<ListState<Post>> get postStream => _postSubject.stream;

  Function(ListState<Post>) get updatePostStream => _postSubject.sink.add;

  /// Get post list from fetchPostList method & update to stream.
  /// Set [init] to true for first load.
  void getPostList({bool init = true}) async {
    int page = init ? 0 : _postSubject.value.page + 1;
    List<Post> tempPostList;

    /// SET DATA STATE
    /// first load
    if (init) {
      /// if local data was empty, set data state to FIRST_LOAD
      if (_dbRepository.getAllPost().isEmpty) {
        updatePostStream(ListState.init());

        /// if local data was not empty,  set data state to FIRST_LOAD_WITH_INIT_DATA
      } else {
        updatePostStream(ListState.initWithData(_dbRepository.getAllPost()));
      }

      /// load more
    } else {
      tempPostList = _postSubject.value.data;
      updatePostStream(ListState.loadMore(tempPostList, page));
    }

    /// FETCH POST LIST
    List<Post> postList = await fetchPostList(page * AppLimit.POST_PAGE_SIZE);

    /// if fetched post list was empty, set data state to LOADED_ALL
    if (postList.isEmpty) {
      updatePostStream(ListState.loadedAll(tempPostList, page - 1));

      /// if first load, set data state to LOADED and replace local data with fetched data
    } else if (init) {
      updatePostStream(ListState.firstLoadSuccess(postList));
      _dbRepository.replacePosts(postList);

      /// if load more, add fetched data to existed data
    } else {
      tempPostList.addAll(postList);
      updatePostStream(ListState.loadMoreSuccess(tempPostList, page));
    }
  }

  /// fetch post list from API
  Future<List<Post>> fetchPostList(int start) async {
    try {
      final ApiServiceModel<ListPost> postApi =
          await _repository.getListPost(start);
      return postApi.data.listPost;
    } catch (err) {
      /// if first load error
      if (start == 0)
        updatePostStream(ListState.firstLoadError());

      /// if load more error
      else
        updatePostStream(ListState.loadMoreError(
            _postSubject.value.data, _postSubject.value.page - 1));
      rethrow;
    }
  }
}
