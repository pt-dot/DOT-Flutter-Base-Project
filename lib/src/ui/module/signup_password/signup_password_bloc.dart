import 'package:base_flutter/src/ui/module/signup_password/signup_password_event.dart';
import 'package:base_flutter/src/ui/module/signup_password/signup_password_state.dart';
import 'package:base_flutter/src/utils/validations/password_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPasswordBloc
    extends Bloc<SignupPasswordEvent, SignupPasswordState> {
  SignupPasswordBloc() : super(SignupPasswordState()) {
    on<SignupPasswordChangeEvent>(_onPasswordChanged);
  }

  void _onPasswordChanged(
    SignupPasswordChangeEvent event,
    Emitter<SignupPasswordState> emit,
  ) {
    final password = Password.dirty(event.password ?? '');
    emit(state.copyWith(
      password: password,
      passwordError: password.error,
      isFormValid: password.isValid,
    ));
  }
}
