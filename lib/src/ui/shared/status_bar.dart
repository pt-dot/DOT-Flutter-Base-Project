import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  final Widget child;
  final bool lightIcon;

  const StatusBar({
    Key? key,
    required this.child,
    this.lightIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: lightIcon ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: child,
    );
  }
}
