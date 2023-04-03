import 'package:base_flutter/src/core/models/user_model.dart';
import 'package:base_flutter/src/ui/module/profile/profile_bloc.dart';
import 'package:base_flutter/src/ui/module/profile/profile_event.dart';
import 'package:base_flutter/src/ui/module/profile/profile_state.dart';
import 'package:base_flutter/src/ui/module/update_profile/update_profile_screen.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:base_flutter/src/ui/shared/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

const int ID_USER = 2;

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProfileBloc();
    _bloc.add(InitProfileEvent(id: ID_USER));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppToolbar(title: 'Profile'),
      body: RefreshIndicator(
        onRefresh: () async {
          _bloc.add(InitProfileEvent(id: ID_USER));
        },
        child: SingleChildScrollView(
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          if (state.user != null) {
            return _buildProfile(state.user);
          } else {
            return Container();
          }
        }
        return _loadingUser();
      },
    );
  }

  Widget _loadingUser() {
    return Center(
      child: Text(
        'Loading...',
        style: TextStyle(
          color: Colors.black,
          fontSize: TextSizeConst.regular,
        ),
      ),
    );
  }

  Widget _buildProfile(UserModel? user) {
    return Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title('Id: ${user?.id}'),
          _content('Name : ${user?.name}'),
          _content('Email : ${user?.email}'),
          _content('Phone : ${user?.phone}'),
          _title('Address'),
          _content('Street : ${user?.address?.street}'),
          _content('Suite : ${user?.address?.suite}'),
          _title('Company'),
          _content('Name : ${user?.company?.name}'),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, UpdateProfileScreen.routeName);
            },
            child: Text(
              'Update Profile',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _title(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: TextSizeConst.medium,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _content(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: TextSizeConst.regular,
      ),
    );
  }
}
