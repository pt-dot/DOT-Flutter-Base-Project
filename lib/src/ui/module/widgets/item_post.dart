import 'package:base_flutter/r.dart';
import 'package:base_flutter/src/core/models/post_model.dart';
import 'package:base_flutter/src/ui/shared/ripple_button.dart';
import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/utils/widget_helper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/sizes.dart';

class ItemPost extends StatelessWidget {
  const ItemPost({this.post});

  final PostModel? post;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(
        BorderRadiusSize.postBorderRadius,
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(MarginSize.smallMargin2),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    AssetImages.profilePic,
                    width: 34,
                    height: 34,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'David'.semiBoldStyle(fontSize: TextSize.small),
                    '3h. Los Angeles'.semiBoldStyle(
                      fontSize: TextSize.addressTextSize,
                      color: lineColor,
                    ),
                  ],
                ).addMarginLeft(MarginSize.sixPixel).addExpanded,
                RippleButton(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AssetIcons.icTrash,
                    width: IconSize.smallSize,
                  ),
                ),
                RippleButton(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AssetIcons.icMoreVertical,
                    width: IconSize.smallSize,
                  ),
                ),
              ],
            ).addMarginBottom(MarginSize.smallMargin),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                BorderRadiusSize.postBorderRadius,
              ),
              child: ExtendedImage.network(
                'https://picsum.photos/seed/${post?.title}/800',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                cache: true,
              ),
            ).addMarginBottom(MarginSize.smallMargin),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RippleButton(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AssetIcons.icLove,
                    width: IconSize.regularSize,
                  ),
                ),
                RippleButton(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AssetIcons.icComment,
                    width: IconSize.regularSize,
                  ),
                ).addSymmetricMargin(horizontal: 2),
                RippleButton(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AssetIcons.icSend,
                    width: IconSize.regularSize,
                  ),
                ),
                Container().addExpanded,
                RippleButton(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AssetIcons.icAttachment,
                    width: IconSize.regularSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
