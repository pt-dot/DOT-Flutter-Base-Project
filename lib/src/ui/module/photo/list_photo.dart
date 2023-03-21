import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_bloc.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_event.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo_state.dart';
import 'package:base_flutter/src/ui/module/widgets/item_album.dart';
import 'package:base_flutter/src/ui/shared/base_common_textinput.dart';
import 'package:base_flutter/src/ui/shared/base_gridview.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';


class ListPhoto extends StatefulWidget {
  @override
  State<ListPhoto> createState() => _ListPhotoState();
}

class _ListPhotoState extends State<ListPhoto> {
  final TextEditingController _searchController = TextEditingController();

  ListPhotoBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ListPhotoBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc!..add(InitListPhotoEvent()),
      child: Scaffold(
          appBar: MyAppToolbar(title: 'Album'),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              Expanded(
                child: BlocConsumer<ListPhotoBloc, ListPhotoState>(
                  listenWhen: (previous, current) =>
                      previous.status != current.status,
                  listener: (context, state) {
                    if (state.status == FormzSubmissionStatus.success) {

                    } else if (state.status == FormzSubmissionStatus.failure) {

                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) => BaseGridView<Album>(
                    items: state.albums,
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    padding: EdgeInsets.all(15.0),
                    onRefresh: () => _bloc?.add(LoadListPhotoEvent()),
                    onLoadMore: () =>
                        _bloc?.add(LoadListPhotoEvent(page: state.page + 1)),
                    itemBuilder: (context, state, data) => ItemAlbum(data),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: BaseCommonTextInput(
        textFieldController: _searchController,
        label: 'Search...',
        onChanged: (p0) {},
      ),
    );
  }
}
