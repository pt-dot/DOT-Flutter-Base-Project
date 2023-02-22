import 'package:base_flutter/src/ui/module/home/home.dart';
import 'package:flutter/material.dart';

import '../../ui/module/splash/splash.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Splash());
      case Home.routeName:
        return MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Home());
      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          ),
        );
    }
  }
}
