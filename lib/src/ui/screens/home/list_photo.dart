import 'package:base_flutter/src/core/bloc/photo_bloc.dart';
import 'package:base_flutter/src/core/data/constants.dart';
import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:base_flutter/src/ui/screens/home/widgets/item_album.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:provider/provider.dart';

class ListPhoto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final PhotoBloc _bloc = Provider.of<PhotoBloc>(context, listen: false);
    final _pageLoadController = PagewiseLoadController(
        pageSize: AppLimit.ALBUM_PAGE_SIZE,
        pageFuture: (pageIndex) => _bloc.getListAlbum(pageIndex * AppLimit.ALBUM_PAGE_SIZE)
    );

    return Scaffold(
      appBar: MyAppToolbar(title: 'Album'),
      body: RefreshIndicator(
        onRefresh: () async {
          _pageLoadController.reset();
          // await Future.value({});
        },
        child:  PagewiseGridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1,
          padding: EdgeInsets.all(12.0),
          pageLoadController: _pageLoadController,
          itemBuilder: (BuildContext context, Album item, int index) {
            return ItemAlbum(item);
          },
        ),
      ),
    );
  }
}