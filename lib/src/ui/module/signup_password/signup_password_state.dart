import 'package:base_flutter/src/utils/validations/password_validation.dart';
import 'package:equatable/equatable.dart';

class SignupPasswordState extends Equatable {
  SignupPasswordState({
    this.isFormValid = false,
    this.password = const Password.pure(),
    this.passwordError,
  });

  final bool isFormValid;
  final Password password;
  final String? passwordError;

  SignupPasswordState copyWith({
    bool? isFormValid,
    Password? password,
    String? passwordError,
  }) {
    return SignupPasswordState(
      isFormValid: isFormValid ?? this.isFormValid,
      password: password ?? this.password,
      passwordError: passwordError,
    );
  }

  @override
  List<Object?> get props => [
        isFormValid,
        password,
        passwordError,
      ];
}
