import 'package:base_flutter/src/ui/shared/app_title.dart';
import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 15),
              Center(
                child: AppTitle(fontSize: 64),
              ),
              SizedBox(height: 51),
              _chooseUserName(),
              SizedBox(height: 3),
              _chooseLater(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomLanguage(),
    );
  }

  Widget _chooseUserName() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Text(
        'Choose Username',
        style: AppTextStyle.mediumStyle.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _chooseLater() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Text(
        'You can always change it later.',
        style: AppTextStyle.mediumStyle.copyWith(
          fontSize: TextSize.superSmall,
          color: lineColor,
        ),
      ),
    );
  }
}
