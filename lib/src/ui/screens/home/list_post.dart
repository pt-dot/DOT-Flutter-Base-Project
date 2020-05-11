import 'package:base_flutter/src/core/bloc/post_bloc.dart';
import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:base_flutter/src/ui/screens/home/widgets/item_post.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:base_flutter/src/utils/base_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:provider/provider.dart';

class ListPost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final PostBloc _postBloc = Provider.of<PostBloc>(context, listen: false);
    _postBloc.getPostList();
    return Scaffold(
      appBar: MyAppToolbar(title: 'Post'),
      body: BaseListView<Post>(
        stream: _postBloc.postStream,
        onRefresh: () async => _postBloc.getPostList(),
        loadMore: () async => _postBloc.getPostList(init: false),
        itemBuilder: (context, state, data) {
          return ItemPost(data);
        },
      )
    );
  }

}