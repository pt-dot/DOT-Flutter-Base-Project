import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../core/data/models/post.dart';

class ListPostState extends Equatable {
  final List<Post> post;
  final FormzStatus status;
  final int page;

  const ListPostState({
    this.post = const [],
    this.status = FormzStatus.pure,
    this.page = 1,
  });

  ListPostState copyWith({
    List<Post>? post,
    FormzStatus? status,
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
