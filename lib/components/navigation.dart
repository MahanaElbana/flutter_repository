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

// =============   Navigation list ============================//

List<ButtonNavigator> screenLists(BuildContext ctx) {
  return [
    // =============   homeSearch ============================//
    const ButtonNavigator(
      // backgroundColor: Colors.grey,
      // hoverColor: Colors.green,
      textString: "search Page",
      screenName: ScreenName.homeSearch,
    ),

    // =============   DrawerScreen ============================//
    const ButtonNavigator(
      backgroundColor: Color.fromARGB(255, 41, 12, 91),
      hoverColor: Colors.pink,
      textString: "Drawer Screen",
      screenName: ScreenName.drawerScreen,
    ),
    // =============  cardListAnimation  ============================//
    const ButtonNavigator(
      backgroundColor: Color.fromARGB(255, 11, 86, 40),
      hoverColor: Color.fromARGB(255, 205, 134, 40),
      textString: "Drawer Screen",
      screenName: ScreenName.cardListAnimation,
    ),
    // =============  subCategories ============================//
    const ButtonNavigator(
      backgroundColor: Color.fromARGB(255, 66, 42, 108),
      hoverColor: Color.fromARGB(255, 205, 40, 100),
      textString: "sub categories animations",
      screenName: ScreenName.subCategories,
    ),
    // =============  subCategories ============================//
    const ButtonNavigator(
      backgroundColor: Color.fromARGB(255, 86, 26, 11),
      hoverColor: Color.fromARGB(255, 197, 205, 40),
      textString: "transform",
      screenName: ScreenName.transformOne,
    ),
  ];
}
