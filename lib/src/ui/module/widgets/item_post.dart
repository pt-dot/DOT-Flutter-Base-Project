import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:flutter/material.dart';

const style = TextStyle(
  color: Colors.black,
  fontSize: 16,
);

class ItemPost extends StatelessWidget {
  const ItemPost({this.post});

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Row(
        children: [
          Text(
            '${post?.id ?? 0}',
            style: style,
          ),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              post?.title ?? '',
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
