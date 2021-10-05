import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_repository/Algorithms/search/home_search.dart';
import 'package:flutter_repository/constants/screen_constanat.dart';

import '../homeScreen.dart';

class RoutePage {
  static Route? onRoutePage(RouteSettings setting) {
    if (setting.name == Navigator.defaultRouteName) {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else if (setting.name == ScreenName.homeSearch) {
      return MaterialPageRoute(builder: (_) => HomeSearch());
    }
  }
}
