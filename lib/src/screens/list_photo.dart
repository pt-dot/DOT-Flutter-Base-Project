import 'package:base_flutter/src/bloc/photo_bloc.dart';
import 'package:base_flutter/src/data/constants.dart';
import 'package:base_flutter/src/models/album.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

class ListPhoto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final PhotoBloc _bloc = PhotoBloc();
    return Scaffold(
      body: PagewiseGridView.count(
      pageSize: ALBUM_PAGE_SIZE,
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 1,
      padding: EdgeInsets.all(15.0),
      itemBuilder: this._albumBuilder,
      pageFuture: (pageIndex) => _bloc.getListAlbum(pageIndex * ALBUM_PAGE_SIZE) )
    );
  }

  Widget _albumBuilder(context, Album item, _)  {
    return Container(
      // height: MediaQuery.of(context).devicePixelRatio,
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