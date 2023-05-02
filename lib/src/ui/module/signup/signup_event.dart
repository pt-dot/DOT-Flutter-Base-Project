import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupChangeUsernameEvent extends SignupEvent {
  SignupChangeUsernameEvent({this.username});
  final String? username;
  @override
  List<Object?> get props => [username];
}