import 'package:flutter/material.dart';

class AppNavigatorFunctions {
  static defaultPush(BuildContext context, Widget child) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return child;
        },
      ),
    );
  }

  static defaultpushReplacement(BuildContext context, Widget child) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return child;
        },
      ),
    );
  }

  static defaultpushAndRemoveUntil(BuildContext context, Widget child) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ), (route) => false);
  }
}
