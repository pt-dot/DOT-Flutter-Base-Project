import 'package:base_flutter/src/core/bloc/profile_bloc.dart';
import 'package:base_flutter/src/ui/shared/ui_constants.dart';
import 'package:base_flutter/src/core/data/models/user.dart';
import 'package:base_flutter/src/core/states/user_state.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const int ID_USER = 2;

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ProfileBloc bloc = Provider.of<ProfileBloc>(context, listen: false);
    bloc.getUser(ID_USER);
    return Scaffold(
      appBar: MyAppToolbar(title: 'Profile'),
      body: RefreshIndicator (
        onRefresh: () async {
          bloc.getUser(ID_USER);
          // await Future.value({});
        },
        child: SingleChildScrollView(
          child: Container(
            child: _buildBody(context, bloc),
          ),
        ),
      )
    );
  }

  Widget _buildBody(BuildContext context, ProfileBloc bloc) {
    return StreamBuilder<UserState>(
      stream: bloc.streamUser,
      builder: (context, snapshot) {
        UserState userState = snapshot.data;
        if (userState is UserLoading) {
          return  Center(
            child: Text('Loading...'),
          );
        }
        if (userState is UserLoaded) {
          return _buildProfile(context, userState.user);
        }
        if (userState is UserError) {
          return Center(
            child: Text(userState.error.toString()),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildProfile(BuildContext context, User user) {
    return Container(
      padding: EdgeInsets.all(dpConverter(context, 4)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
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