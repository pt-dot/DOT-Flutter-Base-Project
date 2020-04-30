import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin URLs {
  static const host = "http://jsonplaceholder.typicode.com/";
  static const assets = '${host}assets';
}


// constant for page limit & timeout
mixin AppLimit {
  static const int REQUEST_TIME_OUT = 30000;
  static const ALBUM_PAGE_SIZE = 18;
  static const POST_PAGE_SIZE =  100;
}

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

  static const primaryColor = MaterialColor(0xFF2CD28A, color);

  static const green = Color(0xFF2CD28A);
  static const orange = Color(0xFFFFB138);
  static const lightBlue = Color(0xFF39A7FE);
  static const blue = Color(0xFF2E59F3);
  static const darkBlue = Color(0xFF203355);
  static const red = Color(0xFFFF6F51);
  static const lightGrey = Color(0xFFF2F2F2);
  static const backgroundColor = Color(0xFFF6F6FA);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF444444);
  static const darkGrey = Color(0xFF828282);
  static const grey = Color(0xFFBCBDC2);

}

// Text Size
mixin TextSizeConst {

  static const verySmall = 8.0;
  static const small = 12.0;
  static const regular = 16.0;
  static const medium = 20.0;
  static const large = 24.0;
  static const veryLarge = 30.0;

}

// Text Style
mixin TextStyleConst {
  static const titleText = TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.w700, fontSize: TextSizeConst.medium);
}

const double baseScreenWidth = 93.8;

double dpConverter(context, double size) {

  double screenWidth = MediaQuery.of(context).size.width;
  
  if (screenWidth > 400 && screenWidth < 500) {
    return size * 21/5;
  } if (screenWidth > 500 && screenWidth < 600) {
    return size * 22/5;
  } else {
    return size * 19/5;
  }
  
}
