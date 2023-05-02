import 'package:base_flutter/src/ui/module/signup/signup_event.dart';
import 'package:base_flutter/src/ui/module/signup/signup_state.dart';
import 'package:base_flutter/src/utils/validations/username_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<SignupChangeUsernameEvent>(_onUsernameChanged);
  }

  void _onUsernameChanged(
    SignupChangeUsernameEvent event,
    Emitter<SignupState> emit,
  ) {
    final username = Username.dirty(event.username ?? '');
    emit(state.copyWith(
      username: username,
      usernameError: username.error,
      isFormValid: username.isValid,
    ));
  }
}
