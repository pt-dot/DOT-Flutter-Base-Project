import 'package:flutter/material.dart';

const MaterialColor appPink = MaterialColor(
  _pinkPrimary,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_pinkPrimary),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);
const int _pinkPrimary = 0xFFFF00B8;

final Gradient linearGradient = LinearGradient(
  colors: <Color>[primary, primaryGradient],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const Color primary = Color(0xFFFF00B8);
const Color primaryGradient = Color(0xFFFF0000);
const Color textColor = Color(0xFF000000);
const Color textTintColor = Color(0xFF535353);
const Color textFieldBackgroundColor = Color(0xFFEAEAEA);
const Color red500 = Color(0xFFFF0000);
const Color successGreen = Color(0xFF087119);
const Color backgroundColor = Color(0xFFF4F8FB);
const Color lineColor = Color(0xFF545454);
const Color borderColor = Color(0x40545454);
