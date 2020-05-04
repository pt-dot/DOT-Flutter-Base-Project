import 'package:base_flutter/src/core/bloc/photo_bloc.dart';
import 'package:base_flutter/src/core/bloc/post_bloc.dart';
import 'package:base_flutter/src/core/bloc/profile_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderList {
  static List<SingleChildWidget> list = [
    Provider(create: (_) => PhotoBloc()),
    Provider(create: (_) => ProfileBloc()),
    Provider(create: (_) => PostBloc(),)
  ];
}