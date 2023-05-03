import 'package:equatable/equatable.dart';

abstract class SignupPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupPasswordChangeEvent extends SignupPasswordEvent {
  SignupPasswordChangeEvent({this.password});
  final String? password;
  @override
  List<Object?> get props => [password];
}