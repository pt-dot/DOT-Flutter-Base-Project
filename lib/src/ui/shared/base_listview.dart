import 'package:flutter/material.dart';

class BaseListView<T> extends StatelessWidget {
  final List<T>? items;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index, T? data) itemBuilder;

  BaseListView({
    required this.items,
    required this.itemBuilder,
    this.onRefresh,
    this.onLoadMore,
    this.padding,
  });

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: items?.length ?? 0,
        itemBuilder: (context, index) => itemBuilder(
          context,
          index,
          items![index],
        ),
      ),
    );
  }
}
