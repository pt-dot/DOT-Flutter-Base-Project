import 'package:base_flutter/src/core/data/hive_constants.dart';
import 'package:base_flutter/src/core/models/user.dart';
import 'package:hive/hive.dart';

class ProfileDbRepository {
  Box<User> boxUser = Hive.box(DB_USER);

  void saveUser(User user) async {
    await boxUser.clear();
    await boxUser.add(user);
  }

  User? getUser() {
    if (boxUser.length > 0) {
      return boxUser.getAt(0);
    } else {
      return null;
    }
  }
}
