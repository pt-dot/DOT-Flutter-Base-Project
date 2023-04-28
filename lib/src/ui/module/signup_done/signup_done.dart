import 'package:base_flutter/src/ui/module/home/home.dart';
import 'package:base_flutter/src/ui/shared/app_title.dart';
import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:base_flutter/src/ui/shared/primary_button.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 15),
              Center(
                child: AppTitle(fontSize: 64),
              ),
              SizedBox(height: 99),
              _welcome(),
              SizedBox(height: 23),
              _buildButton(),
              SizedBox(height: 17),
              _completeRegister(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomLanguage(),
    );
  }

  Widget _welcome() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Column(
        children: [
          Text(
            'Welcome to Picspile',
            style: AppTextStyle.mediumStyle.copyWith(
              fontSize: TextSize.semiLarge,
            ),
          ),
          Text(
            'david.william',
            style: AppTextStyle.mediumStyle.copyWith(
              fontSize: TextSize.semiLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 42,
        child: PrimaryButton(
          onPress: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Home.routeName,
              ModalRoute.withName('/'),
            );
          },
          title: 'Complete Sign-up',
        ),
      ),
    );
  }

  Widget _completeRegister() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Text(
        'Add New Phone Number or Email Address',
        style: AppTextStyle.semiBoldStyle.copyWith(
          fontSize: 10,
          color: lineColor,
        ),
      ),
    );
  }
}
