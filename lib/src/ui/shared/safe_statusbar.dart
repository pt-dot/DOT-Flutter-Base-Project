import 'package:flutter/material.dart';

import 'status_bar.dart';

class SafeStatusBar extends StatelessWidget {
  final bool lightIcon;
  final Color statusBarColor;
  final Widget child;

  const SafeStatusBar({
    Key? key,
    this.lightIcon = true,
    this.statusBarColor = Colors.transparent,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      lightIcon: lightIcon,
      child: Container(
        color: statusBarColor,
        child: SafeArea(
          bottom: false,
          child: child,
        ),
      ),
    );
  }
}
