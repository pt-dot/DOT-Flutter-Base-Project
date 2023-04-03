import 'package:base_flutter/src/core/data/hive_constants.dart';
import 'package:base_flutter/src/core/models/user_model.dart';
import 'package:hive/hive.dart';

class ProfileDbRepository {
  Box<UserModel> boxUser = Hive.box(DB_USER);

  void saveUser(UserModel user) async {
    await boxUser.clear();
    await boxUser.add(user);
  }

  UserModel? getUser() {
    if (boxUser.length > 0) {
      return boxUser.getAt(0);
    } else {
      return null;
    }
  }
}
