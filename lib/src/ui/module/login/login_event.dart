import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginChangeUsernameEvent extends LoginEvent {
  LoginChangeUsernameEvent({this.username});
  final String? username;
  @override
  List<Object?> get props => [username];
}

class LoginChangePasswordEvent extends LoginEvent {
  LoginChangePasswordEvent({this.password});
  final String? password;
  @override
  List<Object?> get props => [password];
}