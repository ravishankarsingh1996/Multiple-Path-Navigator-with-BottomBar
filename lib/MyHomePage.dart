import 'package:bottom_nav_multiple_navigator/PageOne.dart';
import 'package:bottom_nav_multiple_navigator/bottom_navigation.dart';
import 'package:bottom_nav_multiple_navigator/tab_navigator.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabItem currentTab = TabItem.ONE;
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.ONE: GlobalKey<NavigatorState>(),
    TabItem.TWO: GlobalKey<NavigatorState>(),
    TabItem.THREE: GlobalKey<NavigatorState>()
  };
  var tabItem = TabItem.ONE;
  var title = 'Home', previousTitle;

  void _selectTab(TabItem tabItem) {
    setState(() {
      title = description(tabItem);
      currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab].currentState.maybePop(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            InkWell(
              child: Icon(Icons.arrow_back),
              onTap: () => onPop(currentTab),
            )
          ],
        ),
        body: _buildOffstageNavigator(currentTab),
        bottomNavigationBar: BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.ONE:
        return 'One';
      case TabItem.TWO:
        return 'Two';
      case TabItem.THREE:
        return 'Three';
    }
    return '';
  }

  static String descriptionTitle(String tabItem) {
    switch (tabItem) {
      case '/One':
        return 'red';
      case '/Two':
        return 'green';
      case '/':
        return 'Nav';
    }
    return '';
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
        onNavigate: (routeName) {
          setState(() {
            title = descriptionTitle(routeName);
          });
        },
      ),
    );
  }

  onPop(TabItem currentTab) {
    if(navigatorKeys[currentTab].currentState.widget is PageOne)
      title = 'basbsahasbjchb';
    navigatorKeys[currentTab].currentState.pop();
    setState(() {});
  }
}
