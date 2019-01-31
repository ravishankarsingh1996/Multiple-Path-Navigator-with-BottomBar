
import 'package:flutter/material.dart';

enum TabItem { ONE, TWO, THREE }
class TabHelper {
  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.ONE;
      case 1:
        return TabItem.TWO;
      case 2:
        return TabItem.THREE;
    }
    return TabItem.ONE;
  }


  static IconData icon(TabItem tabItem) {
    return Icons.layers;
  }

  static MaterialColor color(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.ONE:
        return Colors.red;
      case TabItem.TWO:
        return Colors.green;
      case TabItem.THREE:
        return Colors.blue;
    }
    return Colors.grey;
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.ONE),
        _buildItem(tabItem: TabItem.TWO),
        _buildItem(tabItem: TabItem.THREE),
      ],
      onTap: (index) => onSelectTab(
        TabHelper.item(index: index),
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {

    IconData icon = TabHelper.icon(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        '',
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? TabHelper.color(item) : Colors.grey;
  }
}