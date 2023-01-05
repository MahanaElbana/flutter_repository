import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  ///////////////     --  Second method ---- using  ScaffoldMessenger
  void snackBarFunc(BuildContext context) {
    ///////// ----------------     ------  SnackBar
    final snackBar = SnackBar(
      content: Container(
        child: Text("SnackBar"),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("UI Widget"),
      ),
      body: Container(
        child: Center(
          // ------ -------  Second method ------ تم استخدام داله خارجيه للوصول الي الكونتكست
          child: TextButton(
            child: Text("hi -- "),
            onPressed: () {
              ///////// ----------------     ------  SnackBar

              snackBarFunc(context);
            },
          ),
        ),
      ),
    );
  }
}
