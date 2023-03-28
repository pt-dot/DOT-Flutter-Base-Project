import 'package:equatable/equatable.dart';

abstract class ListPostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ListPostInitEvent extends ListPostEvent {}

class ListPostRefreshEvent extends ListPostEvent {}
