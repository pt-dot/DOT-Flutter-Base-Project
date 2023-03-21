import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:equatable/equatable.dart';

enum PostStatus {
  initial, success, failure
}

class ListPostState extends Equatable {
  final List<Post> posts;
  final PostStatus status;
  final int page;

  const ListPostState({
    this.posts = const <Post>[],
    this.status = PostStatus.initial,
    this.page = 1,
  });

  ListPostState copyWith({
    List<Post>? posts,
    PostStatus? status,
    int? page,
  }) =>
      ListPostState(
        posts: posts ?? this.posts,
        status: status ?? this.status,
        page: page ?? this.page,
      );

  @override
  List<Object?> get props => [
        posts,
        status,
        page,
      ];

  @override
  bool get stringify => true;
}
