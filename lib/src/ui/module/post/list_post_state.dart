import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:equatable/equatable.dart';

enum PostStatus { initial, success, failure }

class ListPostState extends Equatable {
  final List<Post> posts;
  final PostStatus status;
  final int page;
  final bool hasReachedMax;

  const ListPostState({
    this.posts = const <Post>[],
    this.status = PostStatus.initial,
    this.page = 1,
    this.hasReachedMax = false,
  });

  ListPostState copyWith({
    List<Post>? posts,
    PostStatus? status,
    int? page,
    bool? hasReachedMax,
  }) =>
      ListPostState(
        posts: posts ?? this.posts,
        status: status ?? this.status,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object?> get props => [
        posts,
        status,
        page,
        hasReachedMax,
      ];

  @override
  bool get stringify => true;
}
