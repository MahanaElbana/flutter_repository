import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  ///////////////     --  third method ---- using  GlobalKey<ScaffoldState>() to reach Context
  /// old method
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("UI Widget"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text("hi -- "),
            onPressed: () {
              ///////// ----------------     ------  SnackBar ----------------/////////

              /////// snackBar /////////////
              final snackBar = SnackBar(
                content: Container(child: Text("SnackBar")),
              );

              // ignore: deprecated_member_use
              _scaffoldKey.currentState!.showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );
  }
}
