import 'package:flutter/material.dart';
import 'package:flutter_repository/Algorithms/search/home_search.dart';
import 'package:flutter_repository/components/button_navigator.dart';
import 'package:flutter_repository/constants/screen_constanat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ButtonNavigator> allAlgorithms(BuildContext ctx) {
    return [
      ButtonNavigator(
        backgroundColor: Colors.grey,
        hoverColor: Colors.green,
        text: "search Page",
        function: () => Navigator.pushNamed(ctx, ScreenName.homeSearch),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! ------  appBar ------ //
      appBar: AppBar(
        title: Text("Route page"),
        centerTitle: true,
      ),

      //! ------ body ------ //
      body: Container(
        margin: EdgeInsets.only(top: 8.0),
        alignment: Alignment.topCenter,
        // child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // children: <Widget>[
          //   ...allAlgorithms(context).map((e) => e).toList(),
          //   ...allAlgorithms(context).toList(),
          //   ...allAlgorithms(context)
          // ]
          
          children: allAlgorithms(context),
        ),
      ),

      //! ------ the end of bady ------ //
    );
  }
}
