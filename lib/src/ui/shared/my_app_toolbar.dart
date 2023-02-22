import 'package:flutter/material.dart';

class MyAppToolbar extends StatelessWidget with PreferredSizeWidget {
  MyAppToolbar({this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
