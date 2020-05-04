import 'package:equatable/equatable.dart';

class ListAlbum {

  ListAlbum.fromJson(List<dynamic> json) {
   listAlbum = json.map((dynamic i) => Album.fromJson(i)).toList();
  }

  List<Album> listAlbum;

}

class Album extends Equatable {

  Album({this.userId, this.id, this.title});

  Album.fromJson(dynamic json) {
    userId = int.parse(json['userId'].toString());
    id = int.parse(json['id'].toString());
    title = json['title'].toString();
  }

  int userId;
  int id;
  String title;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }

  @override
  List<Object> get props => <Object>[id, title];

}