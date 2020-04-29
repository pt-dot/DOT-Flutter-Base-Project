import 'package:base_flutter/src/models/user.dart';

abstract class UserState {
  const UserState();
}
class UserUninitialized extends UserState {
  UserUninitialized(this.user);
  final User user;
}
class UserLoading extends UserState {}
class UserLoaded extends UserState {
  UserLoaded(this.user);
  final User user;
}
class UserError extends UserState {
  UserError(this.error);
  final Object error;
}