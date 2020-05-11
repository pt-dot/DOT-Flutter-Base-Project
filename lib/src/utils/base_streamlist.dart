import 'package:base_flutter/src/core/states/data_state.dart';

class BaseStreamList<T> {
  DataState state;
  List<T> data;
  int page;

  BaseStreamList({this.state, this.data, this.page});
}