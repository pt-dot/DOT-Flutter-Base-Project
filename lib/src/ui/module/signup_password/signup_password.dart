import 'package:base_flutter/src/ui/module/signup_done/signup_done.dart';
import 'package:base_flutter/src/ui/module/signup_password/signup_password_bloc.dart';
import 'package:base_flutter/src/ui/module/signup_password/signup_password_event.dart';
import 'package:base_flutter/src/ui/module/signup_password/signup_password_state.dart';
import 'package:base_flutter/src/ui/shared/app_title.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:base_flutter/src/ui/shared/primary_button.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPasswordScreen extends StatefulWidget {
  static const String routeName = 'signup_password';

  @override
  State<StatefulWidget> createState() {
    return _SignUpPasswordScreenState();
  }
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  TextEditingController textControllerPassword = TextEditingController();

  late SignupPasswordBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SignupPasswordBloc>();
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
      child: BlocBuilder<SignupPasswordBloc, SignupPasswordState>(
        bloc: _bloc,
        buildWhen: (prev, current) => prev.password != current.password,
        builder: (context, state) => BaseCommonTextInput(
          textFieldController: textControllerPassword,
          label: 'Password',
          textInputType: TextInputType.visiblePassword,
          onChanged: (value) => _bloc.add(
            SignupPasswordChangeEvent(password: value),
          ),
          error: state.passwordError,
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
        child: BlocBuilder<SignupPasswordBloc, SignupPasswordState>(
          bloc: _bloc,
          buildWhen: (prev, current) => prev.isFormValid != current.isFormValid,
          builder: (context, state) => PrimaryButton(
            onPress: () {
              Navigator.pushNamed(context, SignUpDoneScreen.routeName);
            },
            title: 'Next',
            isEnabled: state.isFormValid,
          ),
        ),
      ),
    );
  }
}
