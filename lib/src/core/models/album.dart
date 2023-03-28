import 'package:hive/hive.dart';

class Album {
  int? userId;
  int? id;
  String? title;

  Album({this.userId, this.id, this.title});

  Album.fromJson(dynamic json) {
    userId = int.parse(json['userId'].toString());
    id = int.parse(json['id'].toString());
    title = json['title'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class ListAlbum {
  ListAlbum({this.listAlbum});

  static ListAlbum fromJson(List<dynamic> json) =>
      ListAlbum(listAlbum: json.map((dynamic i) => Album.fromJson(i)).toList());

  List<Album>? listAlbum;
}
