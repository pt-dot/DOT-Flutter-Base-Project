import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/sizes.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool isEnabled;

  PrimaryButton({
    required this.title,
    required this.onPress,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isEnabled ? linearGradient : linearGradientDisabled,
        borderRadius: BorderRadius.circular(
          BorderSize.smallBorder,
        ),
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onPress : null,
        child: Text(
          title,
          style: AppTextStyle.extraBoldStyle.copyWith(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              BorderSize.smallBorder,
            ),
          ),
        ),
      ),
    );
  }
}
