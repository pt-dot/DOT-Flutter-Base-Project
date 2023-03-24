import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:flutter/material.dart';

class ItemPost extends StatelessWidget {
  const ItemPost({this.post});

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Text(
        '${post?.id}. ${post?.title}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
