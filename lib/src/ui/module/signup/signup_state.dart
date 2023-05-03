import 'package:base_flutter/src/utils/validations/username_validation.dart';
import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  SignupState({
    this.isFormValid = false,
    this.username = const Username.pure(),
    this.usernameError,
  });

  final bool isFormValid;
  final Username username;
  final String? usernameError;

  SignupState copyWith({
    bool? isFormValid,
    Username? username,
    String? usernameError,
  }) {
    return SignupState(
      isFormValid: isFormValid ?? this.isFormValid,
      username: username ?? this.username,
      usernameError: usernameError,
    );
  }

  @override
  List<Object?> get props => [
        isFormValid,
        username,
        usernameError,
      ];
}
