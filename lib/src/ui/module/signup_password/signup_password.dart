import 'package:base_flutter/src/ui/shared/app_title.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:base_flutter/src/ui/shared/primary_button.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';

class SignUpPasswordScreen extends StatefulWidget {
  static const String routeName = 'signup_password';

  @override
  State<StatefulWidget> createState() {
    return _SignUpPasswordScreenState();
  }
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {

  TextEditingController textControllerPassword = TextEditingController();

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
              _createPassword(),
              SizedBox(height: 3),
              _requirementPassword(),
              SizedBox(height: 22),
              _inputPassword(),
              SizedBox(height: 16),
              _buildButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomLanguage(),
    );
  }

  Widget _createPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Text(
        'Create a password',
        style: AppTextStyle.mediumStyle.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _requirementPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Text(
        'For security, your password must be six characters or more.',
        style: AppTextStyle.mediumStyle.copyWith(
          fontSize: TextSize.superSmall,
          color: lineColor,
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: BaseCommonTextInput(
        textFieldController: textControllerPassword,
        label: 'Password',
        textInputType: TextInputType.visiblePassword,
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

          },
          title: 'Next',
        ),
      ),
    );
  }

}