import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseListView<T> extends StatelessWidget {
  final RefreshController controller;
  final List<T>? items;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index, T? data) itemBuilder;

  BaseListView({
    required this.items,
    required this.itemBuilder,
    required this.controller,
    this.onRefresh,
    this.onLoadMore,
    this.padding,
  });

  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: items?.length ?? 0,
        itemBuilder: (context, index) =>
            itemBuilder(context, index, items![index]),
      ),
    );
  }
}
