import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:flutter/material.dart';

class ItemAlbum extends StatelessWidget {
  const ItemAlbum(this.album);

  final Album? album;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(album?.title ?? '', textAlign: TextAlign.center),
      ),
    );
  }
}
