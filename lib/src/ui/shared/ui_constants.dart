import 'package:flutter/material.dart';

// Colors
mixin AppColors {
  static const MaterialColor appBlue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _bluePrimaryValue = 0xFF2196F3;

  static const Color green = Color(0xFF2CD28A);
  static const Color orange = Color(0xFFFFB138);
  static const Color lightBlue = Color(0xFF39A7FE);
  static const Color blue = Color(0xFF2E59F3);
  static const Color darkBlue = Color(0xFF203355);
  static const Color red = Color(0xFFFF6F51);
  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color backgroundColor = Color(0xFFF6F6FA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF444444);
  static const Color darkGrey = Color(0xFF828282);
  static const Color grey = Color(0xFFBCBDC2);
}

// Text Size
mixin TextSizeConst {
  static const double verySmall = 8;
  static const double small = 12;
  static const double regular = 16;
  static const double medium = 20;
  static const double large = 24;
  static const double veryLarge = 30;
}

class DeviceSize {
  static const width = 375.0;
  static const height = 812.0;
}

class MarginSize {
  static const double defaultMargin = 24;
  static const double smallMargin = 4;
  static const double lineMargin = 10;
  static const double regularSize = 12;
  static const double mediumSize = 16;
  static const double bottomScreenMargin = 48;
  static const double itemProfileMargin = 16;
}

class IconSize {
  static const double defaultSize = 24;
  static const double smallSize = 16;
  static const double regularSize = 20;
  static const double mediumSize = 32;
  static const double superLargeSize = 48;
  static const double itemAutomotiveBrandSize = 67;
  static const double itemCarHeight = 192;
  static const double checkBoxSize = 18;
}

class ElevationSize {
  static const double smallElevation = 1.0;
  static const double softElevation = 6.0;
  static const double bigElevation = 16.0;
}

class BorderSize {
  static const double smallBorderRadius = 4.0;
  static const double semiSmallBorderRadius = 6.0;
  static const double regularBorderRadius = 8.0;
  static const double mediumBorderRadius = 12.0;
  static const double largeBorderRadius = 16.0;
  static const double superBorderRadius = 24.0;
}

class HeightSize {
  static const double buttonHeight = 52;
  static const double mediumButtonHeight = 42;
  static const double imageEventHeight = 125;
  static const double bottomSheetHeight = DeviceSize.height / 2;
}

// Text Style
mixin TextStyleConst {
  static const TextStyle titleText = TextStyle(
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w700,
    fontSize: TextSizeConst.medium,
  );
}
