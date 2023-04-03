import 'package:base_flutter/src/core/models/album_model.dart';
import 'package:equatable/equatable.dart';

enum AlbumStatus { initial, success, failure }

class ListPhotoState extends Equatable {
  final List<AlbumModel> albums;
  final AlbumStatus status;
  final int page;
  final bool hasReachedMax;

  const ListPhotoState({
    this.albums = const [],
    this.status = AlbumStatus.initial,
    this.page = 1,
    this.hasReachedMax = false,
  });

  ListPhotoState copyWith({
    List<AlbumModel>? albums,
    AlbumStatus? status,
    int? page,
    bool? hasReachedMax,
  }) =>
      ListPhotoState(
        albums: albums ?? this.albums,
        status: status ?? this.status,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object?> get props => [
        albums,
        status,
        page,
        hasReachedMax,
      ];

  @override
  bool get stringify => true;
}
