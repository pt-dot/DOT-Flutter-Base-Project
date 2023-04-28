import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class SignUpPasswordScreen extends StatefulWidget {
  static const String routeName = 'signup_password';

  @override
  State<StatefulWidget> createState() {
    return _SignUpPasswordScreenState();
  }
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Signup Password'),
      ),
      bottomNavigationBar: BottomLanguage(),
    );
  }
}