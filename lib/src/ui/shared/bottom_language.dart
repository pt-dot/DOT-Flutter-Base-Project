import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';

class BottomLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          thickness: 1,
          height: 1,
          color: lineColor,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text(
              'English (United Kingdom)',
              style: AppTextStyle.regularStyle.copyWith(
                fontSize: TextSize.superSmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
