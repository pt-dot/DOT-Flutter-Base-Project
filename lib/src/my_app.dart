import 'package:base_flutter/src/core/routes/app_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor: Colors.teal,
        fontFamily: 'Product-Sans',
      ),
      onGenerateRoute: AppRoute.routes,
    );
  }
}
