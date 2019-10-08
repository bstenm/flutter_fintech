import 'package:flutter/material.dart';

import '../models/NavigationItemModel.dart';

class BottomNavigation extends StatefulWidget {
  final List<NavigationItemModel> navigationItems;

  BottomNavigation({
    Key key,
    @required this.navigationItems,
  });

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: widget.navigationItems.map((NavigationItemModel item) {
        return BottomNavigationBarItem(
          icon: Icon(item.icon),
          title: Text(item.title),
        );
      }).toList(),
    );
  }
}
