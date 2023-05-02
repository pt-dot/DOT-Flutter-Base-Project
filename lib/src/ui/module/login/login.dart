import 'package:base_flutter/r.dart';
import 'package:base_flutter/src/ui/module/home/home.dart';
import 'package:base_flutter/src/ui/module/login/login_bloc.dart';
import 'package:base_flutter/src/ui/module/login/login_event.dart';
import 'package:base_flutter/src/ui/module/login/login_state.dart';
import 'package:base_flutter/src/ui/module/signup/signup.dart';
import 'package:base_flutter/src/ui/shared/app_title.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/bottom_language.dart';
import 'package:base_flutter/src/ui/shared/primary_button.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController textControllerUserName = TextEditingController();
  final TextEditingController textControllerPassword = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  Future _handleGooleSignIn() async {
    try {
      final result = await _googleSignIn.signIn();
      final authentication = await result?.authentication;
      if (authentication != null)
        loginToFirebase(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken,
        );
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<String?> _getFacebookToken() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken? accessToken = result.accessToken;
      return accessToken?.token;
    } else {
      return null;
    }
  }

  Future _handleGoogleSignIn() async {
    String? facebookAccessToken = await _getFacebookToken();
    loginToFirebase(accessToken: facebookAccessToken, isGoogle: false);
  }

  void loginToFirebase({
    String? accessToken,
    String? idToken,
    bool isGoogle = true,
  }) async {
    // Google Auth Provider
    OAuthCredential? credential;
    if (isGoogle) {
      credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );
    } else {
      credential = FacebookAuthProvider.credential(accessToken ?? '');
    }

    // Sign in with credential to firebase
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    if (userCredential.credential?.accessToken == null) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      Home.routeName,
      ModalRoute.withName('/'),
    );
  }

  late LoginBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<LoginBloc>();
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
              SizedBox(height: 18),
              _haveAccount(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomLanguage(),
    );
  }

  Widget _inputEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: _bloc,
        buildWhen: (prev, current) => prev.username != current.username,
        builder: (context, state) => BaseCommonTextInput(
          textFieldController: textControllerUserName,
          label: 'login.username_label'.tr(),
          onChanged: (value) => _bloc.add(
            LoginChangeUsernameEvent(
              username: value,
            ),
          ),
          error: state.usernameError,
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: _bloc,
        buildWhen: (prev, current) => prev.password != current.password,
        builder: (context, state) => BaseCommonTextInput(
          textFieldController: textControllerPassword,
          label: 'login.password'.tr(),
          textInputType: TextInputType.visiblePassword,
          onChanged: (password) => _bloc.add(
            LoginChangePasswordEvent(
              password: password,
            ),
          ),
          error: state.passwordError,
        ),
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
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _bloc,
          buildWhen: (previous, current) =>
              previous.isFormValid != current.isFormValid,
          builder: (context, state) => PrimaryButton(
            onPress: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Home.routeName,
                ModalRoute.withName('/'),
              );
            },
            title: 'login.login'.tr(),
            isEnabled: state.isFormValid,
          ),
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
            'login.forgot_password'.tr(),
            style: AppTextStyle.regularStyle.copyWith(
              fontSize: TextSize.superSmall,
            ),
          ),
          SizedBox(width: 6),
          Text(
            'login.forgot_password_action'.tr(),
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
              'login.or'.tr(),
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
            GestureDetector(
              onTap: _handleGooleSignIn,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: SvgPicture.asset(AssetIcons.icGoogle),
              ),
            ),
            SizedBox(width: 24),
            GestureDetector(
              onTap: _handleGoogleSignIn,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: SvgPicture.asset(AssetIcons.icFacebook),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _haveAccount() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginSize.defaultMargin,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'login.dont_have_account'.tr(),
              style: AppTextStyle.regularStyle.copyWith(
                fontSize: TextSize.superSmall,
              ),
            ),
            SizedBox(width: 6),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
              child: Text(
                'login.sign_up'.tr(),
                style: AppTextStyle.semiBoldStyle.copyWith(
                  fontSize: TextSize.superSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
