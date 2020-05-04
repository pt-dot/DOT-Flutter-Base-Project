import 'dart:io';

import 'package:base_flutter/src/core/data/hive/address_hive.dart';
import 'package:base_flutter/src/core/data/hive/company_hive.dart';
import 'package:base_flutter/src/core/data/hive/geo_hive.dart';
import 'package:base_flutter/src/core/data/hive/user_hive.dart';
import 'package:base_flutter/src/core/data/hive_constants.dart';
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
        // enabled: isInDebugMode ? true : false,
        enabled: false,
        builder: (context) => MyApp(),
      )
    );
  });

}

void _initHive() async {
  final Directory appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter(CompanyHiveAdapter());
  Hive.registerAdapter(GeoHiveAdapter());
  Hive.registerAdapter(AddressHiveAdapter());
  Hive.registerAdapter(UserHiveAdapter());

  Hive.openBox<UserHive>(DB_USER);
}