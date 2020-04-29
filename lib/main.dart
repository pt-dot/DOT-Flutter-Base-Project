import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/src/utils/app_helper.dart';
import 'package:base_flutter/src/my_app.dart';

void main() => runApp(
  DevicePreview(
    enabled: isInDebugMode ? true : false,
    builder: (context) => MyApp(),
  )
);