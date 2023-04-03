class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.id, this.userId, this.title, this.body});

  PostModel.fromJson(dynamic json) {
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
      ListPost(listPost: json.map((dynamic i) => PostModel.fromJson(i)).toList());

  ListPost({this.listPost});

  List<PostModel>? listPost;
}
