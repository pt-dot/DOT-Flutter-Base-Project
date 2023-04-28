import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'signup';
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SIGN UP'),
      ),
      bottomNavigationBar: BottomLanguage(),
    );
  }
}