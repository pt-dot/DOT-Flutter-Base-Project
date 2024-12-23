import 'package:base_flutter/r.dart';
import 'package:base_flutter/src/ui/module/post/list_post_bloc.dart';
import 'package:base_flutter/src/ui/module/post/list_post_event.dart';
import 'package:base_flutter/src/ui/module/post/list_post_state.dart';
import 'package:base_flutter/src/ui/module/widgets/item_load_more.dart';
import 'package:base_flutter/src/ui/module/widgets/item_post.dart';
import 'package:base_flutter/src/ui/shared/safe_statusbar.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/utils/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/colors.dart';

class ListPost extends StatefulWidget {
  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  // final TextEditingController _searchController = TextEditingController();

  final _scrollController = ScrollController();
  late ListPostBloc _bloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _bloc = ListPostBloc();
    _bloc.add(ListPostInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeStatusBar(
      statusBarColor: backgroundColor,
      lightIcon: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: SvgPicture.asset(
                    AssetIcons.icCircle,
                    width: IconSize.defaultSize,
                  ),
                ),
              ),
              Expanded(
                  child: SvgPicture.asset(
                AssetImages.logo,
                height: 44,
              )),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: SvgPicture.asset(
                    AssetIcons.icChat,
                    width: IconSize.defaultSize,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildSearchBar(),
            BlocBuilder<ListPostBloc, ListPostState>(
              bloc: _bloc,
              buildWhen: (previous, current) {
                return previous.status != current.status ||
                    previous.posts != current.posts ||
                    previous.hasReachedMax != current.hasReachedMax ||
                    previous.page != current.page;
              },
              builder: (context, state) {
                if (state.status == PostStatus.initial) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Expanded(
                    child: _buildList(state),
                  );
                }
              },
            ),
          ],
        ),
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

  // Widget _buildSearchBar() {
  //   return Container(
  //     padding: EdgeInsets.all(15),
  //     child: BaseCommonTextInput(
  //       textFieldController: _searchController,
  //       label: 'Search...',
  //     ),
  //   );
  // }

  Widget _buildList(ListPostState state) {
    return RefreshIndicator(
      onRefresh: () async {
        _bloc.add(ListPostRefreshEvent());
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(14),
        controller: _scrollController,
        itemCount:
            state.hasReachedMax ? state.posts.length : state.posts.length + 1,
        itemBuilder: (context, index) {
          return index >= state.posts.length
              ? ItemLoadMore()
              : ItemPost(
                  post: state.posts[index],
                )
                  .addMarginBottom(22)
                  .animate(
                    delay: (10 * index).ms,
                  )
                  .slideY(begin: 0.4, end: 0, duration: 300.ms)
                  .scaleXY(begin: 0.9)
                  .fadeIn();
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) _bloc.add(ListPostInitEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
