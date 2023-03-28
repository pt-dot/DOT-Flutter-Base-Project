import 'package:base_flutter/src/utils/flavor.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<FlavorConfig> flavorConfig() async {
  try {
    PackageInfo info = await PackageInfo.fromPlatform();
    final packageName = info.packageName;
    if (packageName.endsWith('dev')) {
      return FlavorConfig.development();
    } else if (packageName.endsWith('staging')) {
      return FlavorConfig.staging();
    } else {
      return FlavorConfig.production();
    }
  } catch (error) {
    debugPrint('AppHelper # flavorConfig error $error', wrapWidth: 1024);
  }
  return FlavorConfig.production();
}