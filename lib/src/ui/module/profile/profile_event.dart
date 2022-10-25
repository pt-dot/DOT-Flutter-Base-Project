import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitProfileEvent extends ProfileEvent {
  final int id;

  InitProfileEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
