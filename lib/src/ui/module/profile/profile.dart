import 'package:base_flutter/src/ui/module/profile/profile_bloc.dart';
import 'package:base_flutter/src/ui/module/profile/profile_event.dart';
import 'package:base_flutter/src/ui/module/profile/profile_state.dart';
import 'package:base_flutter/src/ui/shared/ui_constants.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../core/data/models/user.dart';

const int ID_USER = 2;

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProfileBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc!..add(InitProfileEvent(id: ID_USER)),
      child: Scaffold(
          appBar: MyAppToolbar(title: 'Profile'),
          body: RefreshIndicator(
            onRefresh: () async {
              _bloc!.add(InitProfileEvent(id: ID_USER));
            },
            child: SingleChildScrollView(
              child: Container(
                child: _buildBody(),
              ),
            ),
          )),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.user != null
            ? _buildProfile(state.user)
            : state.status == FormzStatus.submissionInProgress
                ? Center(child: Text('Loading...'))
                : Container();
      },
    );
  }

  Widget _buildProfile(User? user) {
    return Container(
      padding: EdgeInsets.all(dpConverter(context, 4)),
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
        ],
      ),
    );
  }

  Widget _title(String content) {
    return Text(content,
        style: TextStyle(
            fontSize: TextSizeConst.medium, fontWeight: FontWeight.bold));
  }

  Widget _content(String content) {
    return Text(content, style: TextStyle(fontSize: TextSizeConst.regular));
  }
}
