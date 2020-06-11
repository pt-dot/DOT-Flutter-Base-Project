import 'package:base_flutter/src/core/states/list_state.dart';
import 'package:flutter/material.dart';

class BaseGridView<T> extends StatelessWidget {

  final Stream<ListState<T>> stream;
  final Future<void> Function() onRefresh;
  final Future<void> Function() loadMore;
  final Widget loadingBuilder;
  final Widget errorBuilder;
  final Widget loadMoreBuilder;
  final Widget header;
  final int crossAxisCount;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;
  final Widget Function(BuildContext context, DataState state, T data) itemBuilder;

  BaseGridView({
    @required this.stream,
    @required this.childAspectRatio,
    @required this.crossAxisCount,
    this.itemBuilder, 
    this.onRefresh, 
    this.errorBuilder,
    this.loadingBuilder,
    this.loadMore,
    this.loadMoreBuilder,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.padding,
    this.header
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
                if (!(
                    snapshot.data.state == DataState.LOAD_MORE || 
                    snapshot.data.state == DataState.LOADED_ALL || 
                    snapshot.data.state == DataState.ERROR_LOAD_MORE ||
                    snapshot.data.state == DataState.FIRST_LOAD
                  )) 
                  loadMore();
              }
            });

            return SingleChildScrollView(
              controller: _scrollController,
              physics: ClampingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  header ?? Container(),
                  _streamBuilderBody(snapshot),
                  _loadMoreWidget(snapshot.data.state)
                ],
              ),
            );

          } else {
            return Container();
          }
        }
      )
    );
  }

  Widget _errorWidget({bool isLoadMore = false}) {
    return Center(
      child: Padding(
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
      )
    );
  }

  Widget _streamBuilderBody(AsyncSnapshot<ListState<T>> snapshot) {

    if (snapshot.data.state == DataState.FIRST_LOAD) {

      return loadingBuilder ?? _loadingIndicator();

    } else if (snapshot.data.state == DataState.ERROR_FIRST_LOAD) {
      
      return errorBuilder ?? _errorWidget();

    } else {

      if (snapshot.hasData && snapshot.data.data.isNotEmpty) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: mainAxisSpacing ?? 0,
            crossAxisSpacing: crossAxisSpacing ?? 0
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: padding ?? EdgeInsets.all(0),
          itemCount: snapshot.data.data.length,
          itemBuilder: (context, index) {
            return itemBuilder(context, snapshot.data.state, snapshot.data.data[index]);
          }
        );
      } else {
        return Container();
      }

    }
  }

  Widget _loadMoreWidget(DataState dataState) {

    if (dataState == DataState.ERROR_LOAD_MORE) {
      return _errorWidget(isLoadMore: true);
    } else if (!(
        dataState == DataState.LOADED_ALL || 
        dataState == DataState.ERROR_FIRST_LOAD || 
        dataState == DataState.FIRST_LOAD)) {
      return loadMoreBuilder ?? _loadingIndicator();
    }
    return Container();

  }

  Widget _loadingIndicator() {
    return Container(padding: EdgeInsets.all(20), child: Center(child: CircularProgressIndicator()));
  }
}