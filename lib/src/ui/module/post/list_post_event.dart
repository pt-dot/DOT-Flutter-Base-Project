import 'package:equatable/equatable.dart';

abstract class ListPostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitListPostEvent extends ListPostEvent {}
