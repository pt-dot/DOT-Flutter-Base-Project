import 'package:base_flutter/src/core/states/list_state.dart';
import 'package:flutter/material.dart';

class BaseListView<T> extends StatelessWidget {
  final Stream<ListState<T>>? stream;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? loadMore;
  final Widget? loadingBuilder;
  final Widget? errorBuilder;
  final Widget? loadMoreBuilder;
  final Widget? header;
  final Widget Function(BuildContext context, DataState state, T data)
      itemBuilder;

  BaseListView(
      {required this.stream,
      required this.itemBuilder,
      this.onRefresh,
      this.errorBuilder,
      this.loadingBuilder,
      this.loadMore,
      this.loadMoreBuilder,
      this.header});

  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh ?? () async {},
        child: StreamBuilder<ListState<T>>(
            stream: stream,
            builder: (streamContext, snapshot) {
              if (snapshot.hasData) {
                _scrollController = ScrollController()
                  ..addListener(() {
                    if (_scrollController?.position.pixels ==
                        _scrollController?.position.maxScrollExtent) {
                      if (!(snapshot.data?.state == DataState.LOAD_MORE ||
                          snapshot.data?.state == DataState.LOADED_ALL ||
                          snapshot.data?.state == DataState.ERROR_LOAD_MORE ||
                          snapshot.data?.state ==
                              DataState.FIRST_LOAD)) if (loadMore != null) {
                        loadMore!();
                      }
                    }
                  });

                return _streamBuilderBody(snapshot);
              } else {
                return Container();
              }
            }));
  }

  Widget _errorWidget({bool isLoadMore = false}) {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text('Error has occured'),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: isLoadMore ? loadMore : onRefresh,
                  child: const Text('RELOAD', style: TextStyle(fontSize: 20)),
                ),
              ],
            )));
  }

  Widget _streamBuilderBody(AsyncSnapshot<ListState<T>> snapshot) {
    if (snapshot.data?.state == DataState.FIRST_LOAD) {
      return loadingBuilder ?? _loadingIndicator();
    } else if (snapshot.data?.state == DataState.ERROR_FIRST_LOAD) {
      return errorBuilder ?? _errorWidget();
    } else {
      if (snapshot.hasData && snapshot.data?.data?.isNotEmpty == true) {
        return ListView.builder(
            physics: ClampingScrollPhysics(),
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: header != null
                ? (snapshot.data?.data?.length ?? 0) + 2
                : (snapshot.data?.data?.length ?? 0) + 1,
            itemBuilder: (context, index) {
              if (index == 0 && header != null)
                return header!;
              else if (header != null &&
                  index == (snapshot.data?.data?.length ?? 0) + 1)
                return _loadMoreWidget(snapshot.data!.state!);
              else if (header == null && index == snapshot.data?.data?.length)
                return _loadMoreWidget(snapshot.data!.state!);
              else
                return itemBuilder(context, snapshot.data!.state!,
                    snapshot.data!.data![index - 1]);
            });
      } else {
        return Container();
      }
    }
  }

  Widget _loadMoreWidget(DataState dataState) {
    if (dataState == DataState.ERROR_LOAD_MORE) {
      return _errorWidget(isLoadMore: true);
    } else if (!(dataState == DataState.LOADED_ALL ||
        dataState == DataState.ERROR_FIRST_LOAD ||
        dataState == DataState.FIRST_LOAD)) {
      return loadMoreBuilder ?? _loadingIndicator();
    }
    return Container();
  }

  Widget _loadingIndicator() {
    return Container(
        padding: EdgeInsets.all(20),
        child: Center(child: CircularProgressIndicator()));
  }
}
