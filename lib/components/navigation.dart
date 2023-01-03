import 'package:flutter/material.dart';
import '../constants/constant_strings.dart';

class ButtonNavigator extends StatelessWidget {
  final String textString;
  final String screenName;
  final Color? hoverColor;
  final Color? backgroundColor;

  const ButtonNavigator({
    Key? key,
    required this.textString,
    required this.screenName,
    this.hoverColor,
    this.backgroundColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        // =============== Boutton style ======================//
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return hoverColor ?? Colors.red;
              }

              return backgroundColor ?? Colors.purple;
            },
          ),
        ),
        // =============== Boutton style ======================//
        onPressed: () => Navigator.pushNamed(context, screenName),
        child: Container(
          margin: const EdgeInsets.all(12.0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.8,
          height: 38.0,
          child: Text(textString,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: FontsApp.fontFamily)),
        ),
      ),
    );
  }
}
