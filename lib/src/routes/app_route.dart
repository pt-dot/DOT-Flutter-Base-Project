import 'package:base_flutter/src/screens/splash.dart';
import 'package:flutter/material.dart';

class AppRoute {

  static Route<dynamic> routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Splash();
        }
      );
    } else {
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          );
        }
      );
    }
  }

}