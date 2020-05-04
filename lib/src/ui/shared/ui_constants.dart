import 'package:flutter/material.dart';

// Colors
mixin AppColors {
  
  static const Map<int, Color> color = {
    50:Color(0x112CD28A),
    100:Color(0x332CD28A),
    200:Color(0x552CD28A),
    300:Color(0x772CD28A),
    400:Color(0x992CD28A),
    500:Color(0xAA2CD28A),
    600:Color(0xCC2CD28A),
    700:Color(0xDD2CD28A),
    800:Color(0xEE2CD28A),
    900:Color(0xFF2CD28A)
  };

  static const MaterialColor primaryColor = MaterialColor(0xFF2CD28A, color);

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

  static const double verySmall = 8.0;
  static const double small = 12.0;
  static const double regular = 16.0;
  static const double medium = 20.0;
  static const double large = 24.0;
  static const double veryLarge = 30.0;

}

// Text Style
mixin TextStyleConst {
  static const TextStyle titleText = TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.w700, fontSize: TextSizeConst.medium);
}

const double baseScreenWidth = 93.8;

double dpConverter(BuildContext context, double size) {

  final double screenWidth = MediaQuery.of(context).size.width;
  
  if (screenWidth > 400 && screenWidth < 500) {
    return size * 21/5;
  } if (screenWidth > 500 && screenWidth < 600) {
    return size * 22/5;
  } else {
    return size * 19/5;
  }
  
}
