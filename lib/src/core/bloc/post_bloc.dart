import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/repositories/api/post_repository.dart';
import 'package:base_flutter/src/core/states/data_state.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc {

  final PostRepository _repository = PostRepository();

  final _listPostSubject = BehaviorSubject<List<Post>>.seeded([]);
  final _statePostSubject = BehaviorSubject<DataState>.seeded(DataState.FIRST_LOAD);

  Stream<List<Post>> get listPostStream => _listPostSubject.stream;
  Stream<DataState> get statePostStream => _statePostSubject.stream;

  void getPostList() async {
    List<Post> postList = await fetchPostList(0);
    _listPostSubject.sink.add(postList);
    _statePostSubject.sink.add(DataState.LOADED);
  }

  Future<List<Post>> fetchPostList(int start) async {
    try {
      final ApiServiceModel<ListPost> postApi = await _repository.getListPost(start);
      return postApi.data.listPost;
    } catch (err) {
      rethrow;
    }
  }
}