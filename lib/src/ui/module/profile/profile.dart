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
  static const kExpandedHeight = 220.0;

  late ProfileBloc _bloc;
  late ScrollController _scrollController;
  Color _textColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _bloc = ProfileBloc();
    _bloc.add(InitProfileEvent(id: ID_USER));
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          _bloc.add(InitProfileEvent(id: ID_USER));
        },
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _buildSliverAppBar(),
            ];
          },
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        return SliverAppBar(
          expandedHeight: kExpandedHeight,
          floating: false,
          pinned: true,
          centerTitle: false,
          title: _isSliverAppBarExpanded
              ? Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                )
              : null,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: EdgeInsets.only(top: 48),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 108,
                    height: 108,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 64,
                      color: AppColors.appBlue,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    state.user?.name ?? '-',
                    style: TextStyleConst.titleText.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
