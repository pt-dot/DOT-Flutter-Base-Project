import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/ui/module/post/list_post_bloc.dart';
import 'package:base_flutter/src/ui/module/post/list_post_event.dart';
import 'package:base_flutter/src/ui/module/post/list_post_state.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../shared/base_listview.dart';
import '../widgets/item_post.dart';

class ListPost extends StatefulWidget {
  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  final TextEditingController _searchController = TextEditingController();

  ListPostBloc? _bloc;
  RefreshController? _refreshController;

  @override
  void initState() {
    super.initState();
    _bloc = ListPostBloc();
    _refreshController = RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc!..add(InitListPostEvent()),
      child: Scaffold(
          appBar: MyAppToolbar(title: 'Post'),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              Expanded(
                child: BlocConsumer<ListPostBloc, ListPostState>(
                  listenWhen: (previous, current) =>
                      previous.status != current.status,
                  listener: (context, state) {
                    if (state.status == FormzStatus.submissionSuccess) {
                      if (_refreshController?.isRefresh == true) {
                        _refreshController?.refreshCompleted();
                      } else if (_refreshController?.isLoading == true) {
                        _refreshController?.loadComplete();
                      }
                    } else if (state.status == FormzStatus.submissionFailure) {
                      if (_refreshController?.isRefresh == true) {
                        _refreshController?.refreshFailed();
                      } else if (_refreshController?.isLoading == true) {
                        _refreshController?.loadFailed();
                      }
                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    return BaseListView<Post>(
                      controller: _refreshController!,
                      items: state.post,
                      onRefresh: () => _bloc?.add(InitListPostEvent()),
                      onLoadMore: () =>
                          _bloc?.add(LoadListPostEvent(page: state.page + 1)),
                      itemBuilder: (context, state, data) => ItemPost(data),
                    );
                  },
                ),
              ),
            ],
          )),
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
}
