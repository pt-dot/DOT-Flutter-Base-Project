import 'package:flutter/material.dart';

class BaseListView<T> extends StatelessWidget {
  final List<T>? items;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index, T? data) itemBuilder;
  final ScrollController? scrollController;

  BaseListView({
    required this.items,
    required this.itemBuilder,
    this.onRefresh,
    this.onLoadMore,
    this.padding,
    this.scrollController,
  });


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        controller: scrollController,
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
