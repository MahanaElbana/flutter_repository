import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  ///////////////     --  first method  deprecated used builder to reach context
  void snackBarFunc(BuildContext context) {
    ///////// ----------------     ------  SnackBar
    final snackBar = SnackBar(
      content: Container(
        child: Text("SnackBar"),
      ),
    );

    ///////////// ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackBar);
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
          // ------ -------  first method ------- تم استخدام البلدر للوصول الي ال كونتكست
          child: Builder(
            builder: (context) => TextButton(
              child: Text("hi -- "),
              onPressed: () {
                ///////// ----------------     ------  SnackBar
                snackBarFunc(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
