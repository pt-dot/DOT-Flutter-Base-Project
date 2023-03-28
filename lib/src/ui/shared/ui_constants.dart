import 'package:flutter/material.dart';

// Colors
mixin AppColors {
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

// Text Style
mixin TextStyleConst {
  static const TextStyle titleText = TextStyle(
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w700,
    fontSize: TextSizeConst.medium,
  );
}