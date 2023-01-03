import 'package:flutter/material.dart';

Future<dynamic> defaultShowModelBottomSheet({
  required BuildContext context,
  final Color? backgroundColor = const Color.fromARGB(20, 0, 0, 0),
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: backgroundColor,
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        margin: const EdgeInsets.only(top: 8)  ,

        decoration: const BoxDecoration(
          color: Color.fromARGB(18, 0, 0, 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          margin: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: const Center(
            child: Text("This is a modal sheet"),
          ),
        ),
      );
    },
  );
}
