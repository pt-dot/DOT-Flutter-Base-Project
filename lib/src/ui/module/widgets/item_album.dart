import 'package:base_flutter/src/core/models/album_model.dart';
import 'package:base_flutter/src/ui/shared/ui_constants.dart';
import 'package:flutter/material.dart';

class ItemAlbum extends StatelessWidget {
  const ItemAlbum(this.album);

  final AlbumModel? album;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          album?.title ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: TextSizeConst.regular,
          ),
        ),
      ),
    );
  }
}
