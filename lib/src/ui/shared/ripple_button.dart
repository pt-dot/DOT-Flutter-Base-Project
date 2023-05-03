import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final Widget child;
  final bool enable;

  const RippleButton({
    super.key,
    this.padding,
    this.onTap,
    this.enable = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(4),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: enable ? onTap : null,
        child: Padding(
          padding: padding ?? EdgeInsets.all(4),
          child: child,
        ),
      ),
    );
  }
}
