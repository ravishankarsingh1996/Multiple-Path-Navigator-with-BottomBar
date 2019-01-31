import 'package:bottom_nav_multiple_navigator/PageInitial.dart';
import 'package:bottom_nav_multiple_navigator/PageOne.dart';
import 'package:bottom_nav_multiple_navigator/PageTwo.dart';
import 'package:bottom_nav_multiple_navigator/bottom_navigation.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String One = '/One';
  static const String Two = '/Two';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem, this.onNavigate});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  final Function(String) onNavigate;

  void _push(BuildContext context, int) {
    var routeBuilders = _routeBuilders(context);
    var newRoute;
    var navigatorRouteName;
    switch (int) {
      case 1:
        navigatorRouteName = TabNavigatorRoutes.One;
        newRoute = MaterialPageRoute(
          builder: (context) => routeBuilders[TabNavigatorRoutes.One](context),
        );
        break;
      case 2:
        navigatorRouteName = TabNavigatorRoutes.Two;
        newRoute = MaterialPageRoute(
          builder: (context) => routeBuilders[TabNavigatorRoutes.Two](context),
        );
        break;
    }
    Navigator.push(
      context,
      newRoute,
    );
    onNavigate(navigatorRouteName);
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => PageInitial(
            pageColor: TabHelper.color(tabItem),
            onPush: (int) => _push(context, int),
          ),
      TabNavigatorRoutes.One: (context) => PageOne(
            pageColor: TabHelper.color(tabItem),
            onPush: (int) => _push(context, int),
          ),
      TabNavigatorRoutes.Two: (context) => PageTwo(
            pageColor: TabHelper.color(tabItem),
            onPush: (int) => _push(context, int),
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        });
  }
}
