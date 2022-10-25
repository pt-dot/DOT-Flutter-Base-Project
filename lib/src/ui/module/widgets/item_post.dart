import 'package:base_flutter/src/core/data/models/post.dart';
import 'package:flutter/material.dart';

class ItemPost extends StatelessWidget {
  const ItemPost(this.post);

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${post?.id}. ${post?.title}'),
          SizedBox(height: 8),
          Divider(
            thickness: 1,
            height: 1,
          )
        ],
      ),
    );
  }
}
