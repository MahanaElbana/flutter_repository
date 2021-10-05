
import 'package:flutter/material.dart';

class ButtonNavigator extends StatelessWidget {
  final String text;
  final Function function;
  final Color hoverColor;
  final Color backgroundColor;
  
  ButtonNavigator({
    required this.text,
    required this.function,
    required this.hoverColor,
    required this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) return this.hoverColor;
            return this.backgroundColor;
          },
        ),
      ),
      onPressed: () => this.function(),
      child: Container(
        margin: EdgeInsets.all(4.0),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.8,
        height: 38.0,
        child: Text("${this.text}",
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
