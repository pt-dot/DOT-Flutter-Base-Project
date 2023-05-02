import 'package:base_flutter/src/ui/module/signup/signup_bloc.dart';
import 'package:base_flutter/src/ui/module/signup/signup_event.dart';
import 'package:base_flutter/src/ui/module/signup/signup_state.dart';
import 'package:base_flutter/src/ui/module/signup_password/signup_password.dart';
import 'package:base_flutter/src/ui/shared/app_title.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:base_flutter/src/ui/shared/primary_button.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'signup';
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUpScreen> {
  TextEditingController textControllerUserName = TextEditingController();

  late SignupBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SignupBloc>();
  }

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
              SizedBox(height: 22),
              _inputUsername(),
              SizedBox(height: 16),
              _buildButton(),
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

  Widget _inputUsername() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: BlocBuilder<SignupBloc, SignupState>(
        bloc: _bloc,
        buildWhen: (prev, current) => prev.username != current.username,
        builder: (context, state) => BaseCommonTextInput(
          textFieldController: textControllerUserName,
          label: 'Username',
          onChanged: (value) => _bloc.add(
            SignupChangeUsernameEvent(
              username: value,
            ),
          ),
          error: state.usernameError,
        ),
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
        child: BlocBuilder<SignupBloc, SignupState>(
          bloc: _bloc,
          buildWhen: (prev, current) => prev.isFormValid != current.isFormValid,
          builder: (context, state) => PrimaryButton(
            onPress: () {
              Navigator.pushNamed(context, SignUpPasswordScreen.routeName);
            },
            title: 'Next',
            isEnabled: state.isFormValid,
          ),
        ),
      ),
    );
  }
}
