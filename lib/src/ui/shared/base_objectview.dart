import 'package:flutter/material.dart';

class BaseObjectView<T> extends StatelessWidget {
  Stream<T> stream;

  BaseObjectView({required this.stream});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
