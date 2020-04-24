import 'package:base_flutter/src/routes/app_route.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base',
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      onGenerateRoute: AppRoute.routes,
    );
  }
}