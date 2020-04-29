import 'package:base_flutter/src/bloc/photo_bloc.dart';
import 'package:base_flutter/src/bloc/profile_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderList {
  static List<SingleChildWidget> list = [
    Provider(create: (_) => PhotoBloc()),
    Provider(create: (_) => ProfileBloc())
  ];
}