import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/core/repositories/post_repository.dart';

class PostBloc {

  final PostRepository _repository = PostRepository();

  Future<List<Post>> getListPost(int start) async {
    try {
      final ListPost listPost = await _repository.getListPost(start);
      return listPost.listPost;
    }catch (err){
      rethrow;
    }
  }
}