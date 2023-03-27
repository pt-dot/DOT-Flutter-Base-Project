import 'package:equatable/equatable.dart';

abstract class ListPhotoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ListPhotoInitEvent extends ListPhotoEvent {}

class ListPhotoRefreshEvent extends ListPhotoEvent {}
