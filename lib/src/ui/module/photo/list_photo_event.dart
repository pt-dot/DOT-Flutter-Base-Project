import 'package:equatable/equatable.dart';

abstract class ListPhotoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitListPhotoEvent extends ListPhotoEvent {}

class LoadListPhotoEvent extends ListPhotoEvent {
  final int page;

  LoadListPhotoEvent({this.page = 1});

  @override
  List<Object?> get props => [page];
}
