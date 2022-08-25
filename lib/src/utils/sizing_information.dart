import 'package:flutter/widgets.dart';

enum DeviceScreenType { Mobile, Tablet, Desktop }

class SizingInformation {
  SizingInformation({
    this.orientation,
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });

  final Orientation? orientation;
  final DeviceScreenType? deviceType;
  final Size? screenSize;
  final Size? localWidgetSize;

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
