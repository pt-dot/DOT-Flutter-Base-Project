import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final dpRatio = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.green,
        height: MediaQuery.of(context).size.height,
        width: dpRatio-12,
        child: Text('Width : $dpRatio - 12'),
      ),
    );
  }

}