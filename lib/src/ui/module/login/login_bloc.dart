import 'package:base_flutter/src/ui/module/login/login_event.dart';
import 'package:base_flutter/src/ui/module/login/login_state.dart';
import 'package:base_flutter/src/utils/validations/password_validation.dart';
import 'package:base_flutter/src/utils/validations/username_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginChangeUsernameEvent>(_onUsernameChanged);
    on<LoginChangePasswordEvent>(_onPasswordChanged);
  }

  void _onUsernameChanged(
    LoginChangeUsernameEvent event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username ?? '');
    emit(state.copyWith(
      username: username,
      usernameError: username.error,
    ));
    _validateInput(emit);
  }

  void _onPasswordChanged(
    LoginChangePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password ?? '');
    emit(state.copyWith(
      password: password,
      passwordError: password.error,
    ));
    _validateInput(emit);
  }

  void _validateInput(
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      isFormValid: state.username.isValid && state.password.isValid,
    ));
  }
}
