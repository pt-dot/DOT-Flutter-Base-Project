import 'package:base_flutter/src/core/models/post_model.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';

class ItemPost extends StatelessWidget {
  const ItemPost({this.post});

  final PostModel? post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Row(
        children: [
          Text(
            '${post?.id ?? 0}',
            style: AppTextStyle.regularStyle,
          ),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              post?.title ?? '',
              style: AppTextStyle.regularStyle,
            ),
          ),
        ],
      ),
    );
  }
}
