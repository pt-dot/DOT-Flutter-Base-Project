import 'package:equatable/equatable.dart';

class ListPost {

  ListPost.fromJson(List<dynamic> json) {
    listPost = json.map((dynamic i) => Post.fromJson(i)).toList();
  }

  List<Post> listPost;

}


class Post extends Equatable{

  Post({this.id, this.userId, this.title, this.body});

  Post.fromJson(dynamic json) {
    userId = int.parse(json['userId'].toString());
    id = int.parse(json['id'].toString());
    title = json['title'].toString();
    body = json['body'].toString();

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  int userId;
  int id;
  String title;
  String body;

  @override
  // TODO: implement props
  List<Object> get props => [id, title];

}