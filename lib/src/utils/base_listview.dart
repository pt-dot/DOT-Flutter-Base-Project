import 'package:base_flutter/src/core/states/data_state.dart';
import 'package:flutter/material.dart';

class BaseListView<T> extends StatelessWidget {

  final Stream<List<T>> dataStream;
  final Stream<DataState> stateStream;
  final Widget Function(BuildContext context, DataState state, List<T> data) builder;

  BaseListView({this.dataStream, this.stateStream, this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataState>(
      stream: stateStream,
      builder: (stateContext, stateSnapshot) {
        if (stateSnapshot.hasData) {
          return StreamBuilder<List<T>>(
            stream: dataStream,
            builder: (dataContext, dataSnapshot) {
              if (dataSnapshot.hasData) {
                return Container(
                  child: builder(context, stateSnapshot.data, dataSnapshot.data),
                );
              } else {
                return Container();
              }
            }
          );
        } else {
          return Container();
        }
      }
    );
  }
}