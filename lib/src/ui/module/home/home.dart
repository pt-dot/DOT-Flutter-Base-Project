import 'package:base_flutter/r.dart';
import 'package:base_flutter/src/ui/module/photo/list_photo.dart';
import 'package:base_flutter/src/ui/module/post/list_post.dart';
import 'package:base_flutter/src/ui/module/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  static const String routeName = 'home';
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> menu = <Widget>[
    ListPost(),
    ListPhoto(),
    Profile(),
    ListPost(),
    ListPhoto(),
  ];

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
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetIcons.icHome),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetIcons.icExplore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetIcons.icAddCircle),
          label: 'Story',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetIcons.icLove),
          label: 'Like',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetIcons.icHome),
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
