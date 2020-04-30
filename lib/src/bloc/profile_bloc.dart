import 'package:base_flutter/src/data/hive/user_hive.dart';
import 'package:base_flutter/src/models/user.dart';
import 'package:base_flutter/src/repositories/profile_repository.dart';
import 'package:base_flutter/src/states/user_state.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {

  final ProfileRepository _profileRepository = ProfileRepository();

  BehaviorSubject<UserState> _userState = BehaviorSubject<UserState>();

  Stream<UserState> get streamUser => _userState.stream;

  Function(UserState) get changeUser => _userState.sink.add;

  Future<void> getUser(int id) async {
    User userDb = UserHive.getUser();
    changeUser(UserLoading());
    try {
      final User user = await _profileRepository.getUser(id);
      final checkData = user == userDb;
      print('Profile Bloc # is data user same ? $checkData');
      if (!checkData) {
        changeUser(UserLoaded(user));
        UserHive.saveUser(user);
      } else {
        changeUser(UserUninitialized(userDb));
      }
    } catch (err) {
      changeUser(UserError(err));
    }
  }

}