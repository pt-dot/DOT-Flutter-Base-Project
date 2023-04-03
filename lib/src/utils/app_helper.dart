import 'package:base_flutter/src/utils/flavor.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

void logDebug(String? message) {
  if (isInDebugMode) {
    debugPrint(message, wrapWidth: 1024);
  }
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
    logDebug('AppHelper # flavorConfig error $error');
  }
  return FlavorConfig.production();
}