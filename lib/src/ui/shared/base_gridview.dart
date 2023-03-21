import 'package:flutter/material.dart';

class BaseGridView<T> extends StatelessWidget {
  final List<T>? items;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final int crossAxisCount;
  final double childAspectRatio;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index, T? data) itemBuilder;

  const BaseGridView({
    required this.items,
    required this.childAspectRatio,
    required this.crossAxisCount,
    required this.itemBuilder,
    this.onRefresh,
    this.onLoadMore,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {

      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: mainAxisSpacing ?? 0,
            crossAxisSpacing: crossAxisSpacing ?? 0),
        shrinkWrap: true,
        padding: padding ?? EdgeInsets.all(0),
        itemCount: items?.length,
        itemBuilder: (context, index) => itemBuilder(
          context,
          index,
          items?[index],
        ),
      ),
    );
  }
}
