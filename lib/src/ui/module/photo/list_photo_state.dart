import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../core/data/models/album.dart';

class ListPhotoState extends Equatable {
  final List<Album> albums;
  final FormzSubmissionStatus status;
  final int page;

  const ListPhotoState({
    this.albums = const [],
    this.status = FormzSubmissionStatus.initial,
    this.page = 1,
  });

  ListPhotoState copyWith({
    List<Album>? albums,
    FormzSubmissionStatus? status,
    int? page,
  }) =>
      ListPhotoState(
        albums: albums ?? this.albums,
        status: status ?? this.status,
        page: page ?? this.page,
      );

  @override
  List<Object?> get props => [
        albums,
        status,
        page,
      ];

  @override
  bool get stringify => true;
}
