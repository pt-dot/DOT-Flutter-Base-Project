import 'package:base_flutter/src/bloc/post_bloc.dart';
import 'package:base_flutter/src/data/constants.dart';
import 'package:base_flutter/src/models/Post.dart';
import 'package:base_flutter/src/widgets/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:provider/provider.dart';

class ListPost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final PostBloc _postBloc = Provider.of<PostBloc>(context, listen: false);
    final _pageLoaderController = PagewiseLoadController(
        pageSize: AppLimit.POST_PAGE_SIZE,
        pageFuture: (pageIndex) => _postBloc.getListPost(pageIndex * AppLimit.POST_PAGE_SIZE)
    );

    return Scaffold(
      appBar: MyAppToolbar(title: 'Post'),
      body: RefreshIndicator(
        onRefresh: () async {
          //refresh page
          _pageLoaderController.reset();
          // await Future.value({});
        },
        child: PagewiseListView(
          padding: EdgeInsets.all(8),
          pageLoadController: _pageLoaderController,
          itemBuilder: this._postCell,
        ),
      )
    );
  }

  Widget _postCell(BuildContext context, Post item, int _){
    return Container(
      child: Text(item.title),
    );
  }

}