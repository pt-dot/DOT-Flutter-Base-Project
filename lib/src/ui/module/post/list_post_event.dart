import 'package:equatable/equatable.dart';

abstract class ListPostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitListPostEvent extends ListPostEvent {}

class LoadListPostEvent extends ListPostEvent {
  final int page;

  LoadListPostEvent({this.page = 1});

  @override
  List<Object?> get props => [page];
}
