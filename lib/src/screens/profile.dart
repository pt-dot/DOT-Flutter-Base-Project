import 'package:base_flutter/src/bloc/profile_bloc.dart';
import 'package:base_flutter/src/data/constants.dart';
import 'package:base_flutter/src/models/user.dart';
import 'package:base_flutter/src/states/user_state.dart';
import 'package:base_flutter/src/widgets/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ProfileBloc bloc = Provider.of<ProfileBloc>(context, listen: false);
    bloc.getUser(1);
    return Scaffold(
      appBar: MyAppToolbar(title: 'Profile'),
      body: _buildBody(context, bloc),
    );
  }

  Widget _buildBody(BuildContext context, ProfileBloc bloc) {
    return StreamBuilder<UserState>(
      stream: bloc.streamUser,
      initialData: UserUninitialized(),
      builder: (context, snapshot) {
        UserState userState = snapshot.data;
        if (userState is UserLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (userState is UserLoaded) {
          return _buildProfile(context, userState.user);
        }
        if (userState is UserError) {
          return Container(
            child: Center(
              child: Text(userState.error.toString()),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildProfile(BuildContext context, User user) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(user.id.toString(), style: TextStyle(fontSize: dpConverter(context, TextSizeConst.verySmall)))
        ],
      ),
    );
  }

}