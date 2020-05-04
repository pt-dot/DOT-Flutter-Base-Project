import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/providers/provider_list.dart';
import 'package:base_flutter/src/core/routes/app_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.list,
      child: MaterialApp(
        title: 'Flutter Base',
        locale: DevicePreview.of(context).locale,
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primaryColor: Colors.teal,
          fontFamily: 'Product-Sans',
        ),
        onGenerateRoute: AppRoute.routes,
      )
    );
  }
}