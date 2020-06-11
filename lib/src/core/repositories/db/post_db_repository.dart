import 'package:base_flutter/src/core/data/hive_constants.dart';
import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:hive/hive.dart';

class PostDbRepository {

  Box<Post> boxPost = Hive.box(DB_POST);

  void replacePosts(List<Post> posts) {
    boxPost.clear().then((result){
      boxPost.addAll(posts);
    });
  }

  List<Post> getAllPost() {
    return boxPost.values.toList();
  }

}