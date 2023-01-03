import 'package:flutter/material.dart';
import 'package:flutter_repository/core/components/navigator_route_button/route_page.dart';
import '../../constants/constant_strings.dart';

class ButtonNavigatorOne extends StatelessWidget {
  final String textString;
  final String screenName;
  final Color? hoverColor;
  final Color? backgroundColor;
  final IconData? iconData;

  const ButtonNavigatorOne({
    super.key,
    required this.textString,
    required this.screenName,
    this.hoverColor,
    this.backgroundColor,
    this.iconData,
  });
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
            // --------------  maximumSize --------------//
            maximumSize:
                MaterialStateProperty.resolveWith<Size>((Set<MaterialState> states) {
          return Size(MediaQuery.of(context).size.width * 0.90, 48.0);
        }),

            // --------------  padding --------------//
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
          return const EdgeInsets.only(left: 11);
        })
            // --------------  padding --------------//
            ),
        // =============== Boutton style ======================//
        onPressed: () => Navigator.pushNamed(context, screenName),
        child: Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              Icon(
                iconData ?? Icons.airplay,
                color: Colors.white,
              ),
              Expanded(
                child: Center(
                  child: Text(textString,
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: FontsApp.fontFamily)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============   Navigation list ============================//

List<ButtonNavigatorOne> screenListsOne(BuildContext context) {
  return [
    // -----------  Zoom Drawer Screen ---------------//
    const ButtonNavigatorOne(
      textString: "Zoom Drawer Screen",
      screenName: AppScreenName.zoomDrawerScreen,
    ),
    // -----------  AnimatedCircPopOutFloating ! ---------------//
  ];
}
