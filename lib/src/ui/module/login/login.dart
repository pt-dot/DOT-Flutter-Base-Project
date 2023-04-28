import 'package:base_flutter/src/ui/shared/app_title.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/primary_button.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textControllerUserName = TextEditingController();
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
              SizedBox(height: 79),
              Center(
                child: AppTitle(),
              ),
              SizedBox(height: 11),
              _inputEmail(),
              SizedBox(height: 18),
              _inputPassword(),
              SizedBox(height: 18),
              _buttonLogin(),
              SizedBox(height: 18),
              _forgotten(),
              SizedBox(height: 18),
              _buildOr(),
              SizedBox(height: 18),
              _buildGoogleFacebook(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: BaseCommonTextInput(
        textFieldController: textControllerUserName,
        label: 'Phone number, email address or username',
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
      ),
    );
  }

  Widget _buttonLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 42,
        child: PrimaryButton(
          onPress: () {},
          title: 'Login',
        ),
      ),
    );
  }

  Widget _forgotten() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Wrap(
        children: [
          Text(
            'Forgotten your login details?',
            style: AppTextStyle.regularStyle.copyWith(
              fontSize: TextSize.superSmall,
            ),
          ),
          SizedBox(width: 6),
          Text(
            'Get help with logging in.',
            style: AppTextStyle.semiBoldStyle.copyWith(
              fontSize: TextSize.superSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOr() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: lineColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Text(
              'OR',
              style: AppTextStyle.semiBoldStyle.copyWith(
                fontSize: TextSize.superSmall,
                color: lineColor,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: lineColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleFacebook() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MarginSize.defaultMargin),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: primary),
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 24),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: primary),
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
