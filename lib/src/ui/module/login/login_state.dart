import 'package:base_flutter/src/utils/validations/password_validation.dart';
import 'package:base_flutter/src/utils/validations/username_validation.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  LoginState({
    this.isFormValid = false,
    this.username = const Username.pure(),
    this.usernameError,
    this.password = const Password.pure(),
    this.passwordError,
  });

  final bool isFormValid;
  final Username username;
  final String? usernameError;
  final Password password;
  final String? passwordError;

  LoginState copyWith({
    bool? isFormValid,
    Username? username,
    String? usernameError,
    Password? password,
    String? passwordError,
  }) {
    return LoginState(
      isFormValid: isFormValid ?? this.isFormValid,
      username: username ?? this.username,
      usernameError: usernameError,
      password: password ?? this.password,
      passwordError: passwordError,
    );
  }

  @override
  List<Object?> get props => [
        isFormValid,
        username,
        usernameError,
        password,
        passwordError,
      ];
}
