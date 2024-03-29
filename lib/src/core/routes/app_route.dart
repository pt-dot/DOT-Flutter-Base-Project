import 'package:base_flutter/src/ui/module/home/home.dart';
import 'package:base_flutter/src/ui/module/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (BuildContext context) => Splash(),
        );
      case Home.routeName:
        return MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text(
                'Page Not Found',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
    }
  }
}
