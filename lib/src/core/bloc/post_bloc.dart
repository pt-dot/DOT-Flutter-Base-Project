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

  void getPostList({bool init = true}) async {

    if (init) { 
      if (_dbRepository.getAllPost().isEmpty) {
        updatePostStream(ListState.init());
      } else {
        updatePostStream(ListState.initWithData(_dbRepository.getAllPost()));
      }
    }

    int page = init ? 0 : _postSubject.value.page + 1;
    List<Post> postList = await fetchPostList(page * AppLimit.POST_PAGE_SIZE);

    if (init) {
      updatePostStream(ListState.firstLoadSuccess(postList));
      _dbRepository.replacePosts(postList);
    } else {
      List<Post> tempPostList = _postSubject.value.data;
      tempPostList.addAll(postList);
      updatePostStream(ListState.loadMoreSuccess(tempPostList, page));
    }

  }

  Future<List<Post>> fetchPostList(int start) async {
    try {
      final ApiServiceModel<ListPost> postApi = await _repository.getListPost(start);
      return postApi.data.listPost;
    } catch (err) {
      if (start == 0) 
        updatePostStream(ListState.firstLoadError());
      else 
        updatePostStream(ListState.loadMoreError(_postSubject.value.data, _postSubject.value.page));
      rethrow;
    }
  }

}