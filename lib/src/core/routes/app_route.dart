import 'package:base_flutter/src/ui/module/home/home.dart';
import 'package:base_flutter/src/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return Splash();
      });
    } else if (settings.name == Home.routeName) {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return Home();
      });
    } else {
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        );
      });
    }
  }
}
