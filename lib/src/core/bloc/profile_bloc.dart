import 'package:base_flutter/src/core/data/models/user.dart';
import 'package:base_flutter/src/core/repositories/profile_repository.dart';
import 'package:base_flutter/src/core/states/user_state.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {

  final ProfileRepository _profileRepository = ProfileRepository();

  final BehaviorSubject<UserState> _userState = BehaviorSubject<UserState>();

  Stream<UserState> get streamUser => _userState.stream;

  Function(UserState) get changeUser => _userState.sink.add;

  Future<void> getUser(int id) async {
    changeUser(UserLoading());
    try {
      final User user = await _profileRepository.getUser(id);
      changeUser(UserLoaded(user));
    } catch (err) {
      changeUser(UserError(err));
    }
  }

}