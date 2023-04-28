import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class SignUpDoneScreen extends StatefulWidget {
  static const String routeName = 'signup_done';
  @override
  State<StatefulWidget> createState() {
    return _SignUpDoneScreenState();
  }
}

class _SignUpDoneScreenState extends State<SignUpDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Text('Signup Done'),
        ),
      ),
      bottomNavigationBar: BottomLanguage(),
    );
  }
}
