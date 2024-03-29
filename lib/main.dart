import 'dart:io';

import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/data/hive_constants.dart';
import 'package:base_flutter/src/core/models/address_model.dart';
import 'package:base_flutter/src/core/models/company_model.dart';
import 'package:base_flutter/src/core/models/geo_model.dart';
import 'package:base_flutter/src/core/models/user_model.dart';
import 'package:base_flutter/src/my_app.dart';
import 'package:base_flutter/src/utils/app_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as service;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupFlavor();
  await _initHive();
  SystemChrome.setPreferredOrientations([
    service.DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(DevicePreview(
      enabled: isInDebugMode,
      builder: (context) => MyApp(),
    ));
  });
}

Future<void> _setupFlavor() async {
  final flavor = await flavorConfig();
  logDebug('Main # $flavor');
  Constants.displayName = flavor.displayName;
  Constants.baseUrl = flavor.baseUrl;
}

Future<void> _initHive() async {
  final Directory appDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter(CompanyModelAdapter());
  Hive.registerAdapter(GeoModelAdapter());
  Hive.registerAdapter(AddressModelAdapter());
  Hive.registerAdapter(UserModelAdapter());

  Hive.openBox<UserModel>(DB_USER);
}
