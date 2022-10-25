import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_bloc.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_event.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_state.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../shared/base_gridview.dart';
import '../widgets/item_album.dart';

class ListPhoto extends StatefulWidget {
  @override
  State<ListPhoto> createState() => _ListPhotoState();
}

class _ListPhotoState extends State<ListPhoto> {
  final TextEditingController _searchController = TextEditingController();

  ListPhotoBloc? _bloc;
  RefreshController? _refreshController;

  @override
  void initState() {
    super.initState();
    _bloc = ListPhotoBloc();
    _refreshController = RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc!..add(InitListPhotoEvent()),
      child: Scaffold(
          appBar: MyAppToolbar(title: 'Album'),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              Expanded(
                child: BlocConsumer<ListPhotoBloc, ListPhotoState>(
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
                  builder: (context, state) => BaseGridView<Album>(
                    controller: _refreshController!,
                    items: state.albums,
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    padding: EdgeInsets.all(15.0),
                    onRefresh: () => _bloc?.add(LoadListPhotoEvent()),
                    onLoadMore: () =>
                        _bloc?.add(LoadListPhotoEvent(page: state.page + 1)),
                    itemBuilder: (context, state, data) => ItemAlbum(data),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: BaseCommonTextInput(
        textFieldController: _searchController,
        label: 'Search...',
        onChanged: (p0) {},
      ),
    );
  }
}
