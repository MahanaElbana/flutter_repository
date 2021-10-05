import 'package:flutter/material.dart';
import 'components/route_page.dart';

void main() {
  runApp(FlutterAlgorithmsAndWidgets());
}

class FlutterAlgorithmsAndWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Algorithms AndWidgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings setting) =>
          RoutePage.onRoutePage(setting),
    );
  }
}
