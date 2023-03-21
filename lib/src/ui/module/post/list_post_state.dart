import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ListPostState extends Equatable {
  final List<Post> post;
  final FormzSubmissionStatus status;
  final int page;

  const ListPostState({
    this.post = const [],
    this.status = FormzSubmissionStatus.initial,
    this.page = 1,
  });

  ListPostState copyWith({
    List<Post>? post,
    FormzSubmissionStatus? status,
    int? page,
  }) =>
      ListPostState(
        post: post ?? this.post,
        status: status ?? this.status,
        page: page ?? this.page,
      );

  @override
  List<Object?> get props => [
        post,
        status,
        page,
      ];

  @override
  bool get stringify => true;
}
