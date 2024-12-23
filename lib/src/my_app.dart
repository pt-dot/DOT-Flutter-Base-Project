import 'package:base_flutter/src/core/routes/app_route.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Flutter Base',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: appPink,
        fontFamily: 'Montserrat',
      ),
      onGenerateRoute: AppRoute.routes,
    );
  }
}
