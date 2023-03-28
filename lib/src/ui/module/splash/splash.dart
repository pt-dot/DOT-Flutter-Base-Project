import 'package:base_flutter/src/ui/module/home/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _delay(context);
    return Scaffold(
      body: Center(
        child: Text(
          'DOT Base Flutter',
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
          Home.routeName,
          ModalRoute.withName('/'),
        );
      }
    });
  }
}
