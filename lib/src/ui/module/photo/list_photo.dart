import 'package:base_flutter/src/ui/module/photo/list_photo_bloc.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_event.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_state.dart';
import 'package:base_flutter/src/ui/module/widgets/item_album.dart';
import 'package:base_flutter/src/ui/module/widgets/item_load_more.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPhoto extends StatefulWidget {
  @override
  State<ListPhoto> createState() => _ListPhotoState();
}

class _ListPhotoState extends State<ListPhoto> {
  final TextEditingController _searchController = TextEditingController();

  final _scrollController = ScrollController();
  late ListPhotoBloc _bloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _bloc = ListPhotoBloc();
    _bloc.add(ListPhotoInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppToolbar(title: 'Album'),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          BlocBuilder<ListPhotoBloc, ListPhotoState>(
            bloc: _bloc,
            buildWhen: (previous, current) {
              return previous.status != current.status ||
                  previous.albums != current.albums ||
                  previous.hasReachedMax != current.hasReachedMax ||
                  previous.page != current.page;
            },
            builder: (context, state) {
              if (state.status == AlbumStatus.initial) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Expanded(child: _buildGrid(state));
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
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

  Widget _buildGrid(ListPhotoState state) {
    final length = state.albums.length;
    return RefreshIndicator(
      onRefresh: () async {
        _bloc.add(ListPhotoRefreshEvent());
      },
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemCount: state.hasReachedMax ? length : length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return index >= length
              ? ItemLoadMore()
              : ItemAlbum(state.albums[index]);
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) _bloc.add(ListPhotoInitEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
