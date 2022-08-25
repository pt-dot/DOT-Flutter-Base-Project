import 'package:base_flutter/src/core/data/models/user.dart';
import 'package:base_flutter/src/core/networks/api_service_model.dart';
import 'package:base_flutter/src/core/repositories/db/profile_db_repository.dart';
import 'package:base_flutter/src/core/repositories/api/profile_repository.dart';
import 'package:base_flutter/src/core/states/object_state.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  final ProfileRepository _profileRepository;
  final ProfileDbRepository _profileDbRepository = ProfileDbRepository();

  final BehaviorSubject<ObjectState<User>> _userState =
      BehaviorSubject<ObjectState<User>>();

  Stream<ObjectState<User>> get streamUser => _userState.stream;

  Function(ObjectState<User>) get changeUser => _userState.sink.add;

  ProfileBloc(this._profileRepository);

  Future<void> getUser(int id) async {
    if (_profileDbRepository.getUser() == null) {
      changeUser(ObjectLoading());
    } else {
      changeUser(ObjectLoaded(_profileDbRepository.getUser()!));
    }
    try {
      final ApiServiceModel<User> user = await _profileRepository.getUser(id);
      bool check = user.data == _profileDbRepository.getUser();
      print('Profile Bloc # is data same? $check');
      if (!check) {
        changeUser(ObjectLoaded(user.data!));
        _profileDbRepository.saveUser(user.data!);
      }
    } catch (err) {
      changeUser(ObjectError(err));
    }
  }
}
