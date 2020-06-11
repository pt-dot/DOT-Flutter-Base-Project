import 'package:base_flutter/src/core/data/hive_constants.dart';
import 'package:base_flutter/src/core/data/models/album.dart';
import 'package:hive/hive.dart';

class AlbumDbRepository {
  
  Box<Album> boxAlbum = Hive.box<Album>(DB_ALBUM);

  void replaceAlbums(List<Album> values) {
    boxAlbum.clear().then((value) {
      boxAlbum.addAll(values);
    });
  }

  List<Album> getAllAlbum() {
    return boxAlbum.values.toList();
  }

}