import 'package:base_flutter/src/ui/constants/text_sizes.dart';
import 'package:base_flutter/src/ui/constants/text_styles.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Color disableColor;
  final bool enable;

  const RoundedButton({
    Key? key,
    required this.onPress,
    required this.title,
    this.titleColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.enable = true,
    this.disableColor = Colors.black45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onPress : () {},
      child: Text(
        title,
        style: AppTextStyle.mediumStyle.copyWith(
          color: titleColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: enable ? backgroundColor : disableColor,
        onSurface: disableColor,
        splashFactory: NoSplash.splashFactory,
        elevation: enable ? null : 0.0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderSize.regularBorderRadius),
        ),
      ),
    );
  }
}
