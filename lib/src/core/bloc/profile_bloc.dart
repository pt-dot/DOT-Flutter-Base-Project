import 'package:base_flutter/src/core/data/models/user.dart';
import 'package:base_flutter/src/core/repositories/db/profile_db_repository.dart';
import 'package:base_flutter/src/core/repositories/api/profile_repository.dart';
import 'package:base_flutter/src/core/states/user_state.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {

  final ProfileRepository _profileRepository = ProfileRepository();
  final ProfileDbRepository _profileDbRepository = ProfileDbRepository();

  final BehaviorSubject<UserState> _userState = BehaviorSubject<UserState>();

  Stream<UserState> get streamUser => _userState.stream;

  Function(UserState) get changeUser => _userState.sink.add;

  Future<void> getUser(int id) async {
    if (_profileDbRepository.getUser() == null) {
      changeUser(UserLoading());
    } else {
      changeUser(UserLoaded(_profileDbRepository.getUser()));
    }
    try {
      final User user = await _profileRepository.getUser(id);
      bool check = user == _profileDbRepository.getUser();
      print('Profile Bloc # is data same? $check');
      if (!check) {
        changeUser(UserLoaded(user));
        _profileDbRepository.saveUser(user);
      }
    } catch (err) {
      changeUser(UserError(err));
    }
  }

}