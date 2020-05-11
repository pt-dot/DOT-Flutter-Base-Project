import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/repositories/api/post_repository.dart';
import 'package:base_flutter/src/core/states/data_state.dart';
import 'package:base_flutter/src/utils/base_streamlist.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc {

  final PostRepository _repository = PostRepository();

  final _postSubject = BehaviorSubject<BaseStreamList<Post>>.seeded(
    BaseStreamList(
      page: 0,
      data: <Post>[],
      state: DataState.FIRST_LOAD
    )
  );

  Stream<BaseStreamList<Post>> get postStream => _postSubject.stream;

  void getPostList({bool init = true}) async {
    int page = init ? 0 : _postSubject.value.page + 1;
    List<Post> postList = await fetchPostList(page * AppLimit.POST_PAGE_SIZE);
    if (page == 0) {
      updateStreamList<Post>(_postSubject, data: postList, state: DataState.LOADED, page: 0);
    } else {
      List<Post> tempPostList = _postSubject.value.data;
      tempPostList.addAll(postList);
      updateStreamList<Post>(_postSubject, data: tempPostList, state: DataState.LOADED, page: page);
    }
  }

  Future<List<Post>> fetchPostList(int start) async {
    try {
      final ApiServiceModel<ListPost> postApi = await _repository.getListPost(start);
      return postApi.data.listPost;
    } catch (err) {
      rethrow;
    }
  }

  void updateStreamList<T> (BehaviorSubject<BaseStreamList<T>> subject, {DataState state, int page, List<T> data}) {
    subject.sink.add(BaseStreamList(
      state: state ?? subject.value.state,
      page: page ?? subject.value.page,
      data: data ?? subject.value.data
    ));
  }

}