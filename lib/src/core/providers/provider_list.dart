import 'package:base_flutter/src/core/bloc/photo_bloc.dart';
import 'package:base_flutter/src/core/bloc/post_bloc.dart';
import 'package:base_flutter/src/core/bloc/profile_bloc.dart';
import 'package:base_flutter/src/core/networks/network_helper.dart';
import 'package:base_flutter/src/core/repositories/api/photo_repository.dart';
import 'package:base_flutter/src/core/repositories/api/post_repository.dart';
import 'package:base_flutter/src/core/repositories/api/profile_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderList {
  static List<SingleChildWidget> list = [
    Provider(create: (_) => NetworkHelper()),
    
    ProxyProvider<NetworkHelper, PhotoRepository>(update: (context, network, repository) => PhotoRepository(network)),
    ProxyProvider<NetworkHelper, PostRepository>(update: (context, network, repository) => PostRepository(network)),
    ProxyProvider<NetworkHelper, ProfileRepository>(update: (context, network, repository) => ProfileRepository(network)),
    
    ProxyProvider<PhotoRepository, PhotoBloc>(update: (context, repository, bloc) => PhotoBloc(repository)),
    ProxyProvider<PostRepository, PostBloc>(update: (context, repository, bloc) => PostBloc(repository)),
    ProxyProvider<ProfileRepository, ProfileBloc>(update: (context, repository, bloc) => ProfileBloc(repository)),

  ];
}
