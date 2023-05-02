import 'package:base_flutter/src/ui/module/login/login_event.dart';
import 'package:base_flutter/src/ui/module/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginChangeUsernameEvent>(_onUsernameChanged);
    on<LoginChangePasswordEvent>(_onPasswordChanged);
  }

  void _onUsernameChanged(
    LoginChangeUsernameEvent event,
    Emitter<LoginState> emit,
  ) {}

  void _onPasswordChanged(
    LoginChangePasswordEvent event,
    Emitter<LoginState> emit,
  ) {}
}
