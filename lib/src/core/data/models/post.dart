import 'package:hive/hive.dart';
part 'post.g.dart';

@HiveType(typeId: 6)
class Post extends HiveObject {
  @HiveField(0)
  int? userId;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? body;

  Post({this.id, this.userId, this.title, this.body});

  Post.fromJson(dynamic json) {
    userId = int.parse(json['userId'].toString());
    id = int.parse(json['id'].toString());
    title = json['title'].toString();
    body = json['body'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}

class ListPost {
  static ListPost fromJson(List<dynamic> json) =>
      ListPost(listPost: json.map((dynamic i) => Post.fromJson(i)).toList());

  ListPost({this.listPost});

  List<Post>? listPost;
}
