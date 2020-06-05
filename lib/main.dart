import 'dart:io';

import 'package:base_flutter/src/core/data/hive_constants.dart';
import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/core/data/models/user.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_flutter/src/utils/app_helper.dart';
import 'package:base_flutter/src/my_app.dart';
import 'package:flutter/services.dart' as service;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initHive();
  SystemChrome.setPreferredOrientations([service.DeviceOrientation.portraitUp]).then((_){
    runApp(
      DevicePreview(
        enabled: isInDebugMode ? false : false,
        builder: (context) => MyApp(),
      )
    );
  });

}

void _initHive() async {
  final Directory appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(GeoAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PostAdapter());
  Hive.registerAdapter(AlbumAdapter());

  Hive.openBox<User>(DB_USER);
  Hive.openBox<Post>(DB_POST);
  Hive.openBox<Album>(DB_ALBUM);

}