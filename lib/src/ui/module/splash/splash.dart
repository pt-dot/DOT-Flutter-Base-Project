import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/ui/module/login/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _delay(context);
    return Scaffold(
      body: Center(
        child: Text(
          Constants.displayName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _delay(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 2), () {
      // Always check if the widget is mounted in async function that require context
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.routeName,
          ModalRoute.withName('/'),
        );
      }
    });
  }
}
