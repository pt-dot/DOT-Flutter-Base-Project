import 'package:base_flutter/src/core/states/data_state.dart';
import 'package:base_flutter/src/utils/base_streamlist.dart';
import 'package:flutter/material.dart';

class BaseListView<T> extends StatelessWidget {

  final Stream<BaseStreamList<T>> stream;
  final Future<void> Function() onRefresh;
  final Future<void> Function() loadMore;
  final Widget loadingBuilder;
  final Widget errorBuilder;
  final Widget loadMoreBuilder;
  final Widget Function(BuildContext context, DataState state, T data) itemBuilder;

  BaseListView({
    @required this.stream, 
    this.itemBuilder, 
    this.onRefresh, 
    this.errorBuilder,
    this.loadingBuilder,
    this.loadMore,
    this.loadMoreBuilder
  });
    
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {

    _scrollController = ScrollController()..addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });

    return RefreshIndicator(
      onRefresh: onRefresh ?? () async =>  null,
      child: StreamBuilder<BaseStreamList<T>>(
        stream: stream,
        builder: (streamContext, snapshot) {
          if (snapshot.hasData) {

            if (snapshot.data.state == DataState.FIRST_LOAD) {
              if (loadingBuilder != null) {
                return loadingBuilder;
              } else {
                return Center(child: CircularProgressIndicator());
              }

            } else if (snapshot.data.state == DataState.ERROR_FIRST_LOAD) {
              
              if (errorBuilder != null) {
                return errorBuilder;
              } else {
                return Center(child: Text('Error has occured'));
              }

            } else {

              if (snapshot.hasData && snapshot.data.data.isNotEmpty) {
                return ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: snapshot.data.state != DataState.LOADED_ALL ? snapshot.data.data.length + 1 : snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data.state != DataState.LOADED_ALL && index == snapshot.data.data.length) {
                      return loadMoreBuilder ?? Container(padding: EdgeInsets.all(20), child: Center(child: CircularProgressIndicator()));
                    } else {
                      return itemBuilder(context, snapshot.data.state, snapshot.data.data[index]);
                    }
                  }
                );
              } else {
                return Container();
              }

            }

          } else {
            return Container();
          }
        }
      )
    );
  }
}