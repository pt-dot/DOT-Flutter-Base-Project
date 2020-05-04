import 'package:base_flutter/src/bloc/photo_bloc.dart';
import 'package:base_flutter/src/data/constants.dart';
import 'package:base_flutter/src/models/album.dart';
import 'package:base_flutter/src/widgets/my_app_toolbar.dart';
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
          itemBuilder: this._albumBuilder,
        ),
      ),
    );
  }

  Widget _albumBuilder(BuildContext context, Album item, int _)  {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(item.title),
      ),
    );
  }
}