import 'package:flutter/material.dart';
import 'package:flutter_repository/core/components/app_theme.dart';
import 'package:flutter_repository/list_card_animation/list_card_animation.dart';
import 'core/components/route_page.dart';

void main() {
  runApp( const RepoFlutter());
}

class RepoFlutter extends StatelessWidget {
  const RepoFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ---------- allow scrollable listView on desktop(liunx) -----//
      scrollBehavior: AppScrollBehavior(),

      debugShowCheckedModeBanner: false,
      theme: appThemeData ,
      initialRoute: Navigator.defaultRouteName,
      onGenerateRoute: (RouteSettings setting) =>
          RoutePage.onRoutePage(setting),
    );
  }
}
