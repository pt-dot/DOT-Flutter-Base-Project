import 'package:base_flutter/src/data/constants.dart';
import 'package:base_flutter/src/screens/list_photo.dart';
import 'package:base_flutter/src/screens/list_post.dart';
import 'package:base_flutter/src/screens/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = 'home';
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  int _selectedIndex = 0;
  final List<Widget> menu = <Widget>[ListPost(), ListPhoto(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: menu.map((t) => Center(child: t)).toList(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          title: Text('List Post'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          title: Text('List Photo'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}