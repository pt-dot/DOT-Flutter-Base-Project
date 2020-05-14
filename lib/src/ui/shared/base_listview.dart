import 'package:base_flutter/src/core/states/list_state.dart';
import 'package:flutter/material.dart';

class BaseListView<T> extends StatelessWidget {

  final Stream<ListState<T>> stream;
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

    return RefreshIndicator(
      onRefresh: onRefresh ?? () async =>  null,
      child: StreamBuilder<ListState<T>>(
        stream: stream,
        builder: (streamContext, snapshot) {
          if (snapshot.hasData) {

            _scrollController = ScrollController()..addListener(() {
              if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
                if (!(snapshot.data.state == DataState.LOAD_MORE || snapshot.data.state == DataState.LOADED_ALL || snapshot.data.state == DataState.ERROR_LOAD_MORE )) 
                  loadMore();
              }
            });

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
                return Center(child: _errorWidget());
              }

            } else {

              if (snapshot.hasData && snapshot.data.data.isNotEmpty) {

                return ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: snapshot.data.state == DataState.LOADED_ALL
                    ? snapshot.data.data.length
                    : snapshot.data.data.length + 1,
                  itemBuilder: (context, index) {

                    if (snapshot.data.state == DataState.ERROR_LOAD_MORE && index == snapshot.data.data.length) {
                      return _errorWidget(isLoadMore: true);
                    } else if (snapshot.data.state != DataState.LOADED_ALL && index == snapshot.data.data.length) {
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

  Widget _errorWidget({bool isLoadMore = false}) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('Error has occured'),
          SizedBox(height: 20,),
          RaisedButton(
            onPressed: isLoadMore ? loadMore : onRefresh,
            child: const Text('RELOAD', style: TextStyle(fontSize: 20)),
          ),
        ],
      )
    );
  }

}