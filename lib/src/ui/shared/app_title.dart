import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:base_flutter/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final double? fontSize;

  AppTitle({
    this.fontSize = 96,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (size) {
        return linearGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        );
      },
      child: Text(
        'Picspile',
        style: AppTextStyle.titleStyle.copyWith(
          color: primary,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
