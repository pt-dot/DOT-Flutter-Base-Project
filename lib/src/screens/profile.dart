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
      padding: EdgeInsets.all(dpConverter(context, 4)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title('Id: ${user.id}'),
          _content('Name : ${user.name}'),
          _content('Email : ${user.email}'),
          _content('Phone : ${user.phone}'),
          _title('Address'),
          _content('Street : ${user.address.street}'),
          _content('Suite : ${user.address.suite}'),
          _title('Company'),
          _content('Name : ${user.company.name}'),
        ],
      ),
    );
  }

  Widget _title(String content) {
    return Text(content, style: TextStyle(fontSize: TextSizeConst.medium, fontWeight: FontWeight.bold));
  }

  Widget _content(String content) {
    return Text(content, style: TextStyle(fontSize: TextSizeConst.regular));
  }

}