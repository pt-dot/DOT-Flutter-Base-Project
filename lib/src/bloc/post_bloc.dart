import 'package:base_flutter/src/models/Post.dart';
import 'package:base_flutter/src/repositories/post_repository.dart';

class PostBloc {

  final PostRepository _repository = PostRepository();

  Future<List<Post>> getListPost(int start) async {
    try {
      final listPost = await _repository.getListPost(start);
      print('post_bloc');
      return listPost.listPost;
    }catch (err){
      rethrow;
    }
  }
}