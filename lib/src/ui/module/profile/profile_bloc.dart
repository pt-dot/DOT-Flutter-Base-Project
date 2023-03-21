import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/repositories/api/profile_repository.dart';
import 'package:base_flutter/src/core/repositories/db/profile_db_repository.dart';
import 'package:base_flutter/src/ui/module/profile/profile_event.dart';
import 'package:base_flutter/src/ui/module/profile/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository? _repository;
  final ProfileDbRepository _dbRepository = ProfileDbRepository();
  ProfileBloc() : super(const ProfileState()) {
    _repository = ProfileRepository(NetworkHelper());
    on<InitProfileEvent>(_onInit);
  }

  Future<void> _onInit(
    InitProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final result = await _repository?.getUser(event.id);
      final user = result?.data;

      /// save to local
      if (user != null) {
        _dbRepository.saveUser(user);
      }

      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        user: user,
      ));
    } catch (e) {
      final user = _dbRepository.getUser();
      emit(state.copyWith(
        user: user,
        status: FormzSubmissionStatus.failure,
      ));
    }
  }
}
