import 'package:flutter/material.dart';
import 'package:flutter_repository/list_card_animation/list_card_animation.dart';
import 'components/route_page.dart';

void main() {
  runApp( const RepoFlutter());
}

class RepoFlutter extends StatelessWidget {
  const RepoFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Algorithms AndWidgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Navigator.defaultRouteName,
      onGenerateRoute: (RouteSettings setting) =>
          RoutePage.onRoutePage(setting),
    );
  }
}
