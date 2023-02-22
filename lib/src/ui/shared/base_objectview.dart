import 'package:flutter/material.dart';

class BaseObjectView<T> extends StatelessWidget {
  final Stream<T> stream;
  const BaseObjectView({required this.stream});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
