import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../core/data/models/album.dart';

class ListPhotoState extends Equatable {
  final List<Album> albums;
  final FormzStatus status;
  final int page;

  const ListPhotoState({
    this.albums = const [],
    this.status = FormzStatus.pure,
    this.page = 1,
  });

  ListPhotoState copyWith({
    List<Album>? albums,
    FormzStatus? status,
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
