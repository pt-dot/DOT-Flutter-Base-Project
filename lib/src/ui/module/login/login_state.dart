import 'package:base_flutter/src/utils/validations/password_validation.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  LoginState({
    this.password = const Password.pure(),
    this.passwordError,
  });

  final Password password;
  final String? passwordError;

  LoginState copyWith({
    Password? password,
    String? passwordError,
  }) {
    return LoginState(
      password: password ?? this.password,
      passwordError: passwordError,
    );
  }

  @override
  List<Object?> get props => [
        password,
        passwordError,
      ];
}
