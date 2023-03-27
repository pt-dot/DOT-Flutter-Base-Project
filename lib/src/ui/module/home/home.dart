import 'package:base_flutter/src/ui/module/photo/list_photo.dart';
import 'package:base_flutter/src/ui/module/post/list_post.dart';
import 'package:base_flutter/src/ui/module/profile/profile.dart';
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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          label: 'List Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'List Photo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
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
