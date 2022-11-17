import 'package:flutter/material.dart';
import 'package:flutter_repository/Algorithms/search/home_search.dart';
import 'package:flutter_repository/constants/constant_strings.dart';
import 'package:flutter_repository/drawer/drawer_screen.dart';

import '../home_screen.dart';

class RoutePage {
  static Route? onRoutePage(RouteSettings setting) {
    if (setting.name == Navigator.defaultRouteName) {
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    } else if (setting.name == ScreenName.homeSearch) {
      return MaterialPageRoute(
        builder: (_) => const HomeSearch(),
      );
    } else if (setting.name == ScreenName.drawerScreen) {
      return MaterialPageRoute(
        builder: (_) => const DrawerScreen(),
      );
    }

    // ====================== if route not founded ================//
    else {
      return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Route NOT FOUND !'),
            ),
            body: const Text('Route NOT FOUND !'),
          );
        },
      );
    }
    // ====================== if route not founded ================//
  }
}
