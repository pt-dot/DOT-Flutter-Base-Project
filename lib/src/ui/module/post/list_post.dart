import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/ui/module/post/list_post_bloc.dart';
import 'package:base_flutter/src/ui/module/post/list_post_event.dart';
import 'package:base_flutter/src/ui/module/post/list_post_state.dart';
import 'package:base_flutter/src/ui/module/widgets/item_post.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/base_listview.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ListPost extends StatefulWidget {
  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  final TextEditingController _searchController = TextEditingController();

  final _scrollController = ScrollController();
  late ListPostBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ListPostBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppToolbar(title: 'Post'),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          BlocBuilder<ListPostBloc, ListPostState>(
            bloc: _bloc,
            buildWhen: (previous, current) {
              return previous.status != current.status ||
                  previous.posts != current.posts;
            },
            builder: (context, state) {
              if (state.status == PostStatus.initial) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(15),
      child: BaseCommonTextInput(
        textFieldController: _searchController,
        label: 'Search...',
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) _bloc.add(InitListPostEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
