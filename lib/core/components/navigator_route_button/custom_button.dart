import 'package:flutter/material.dart';
import 'package:flutter_repository/core/components/navigator_route_button/app_navigator_functions.dart';
import 'package:flutter_repository/views/animated_circ_pop_out_floating.dart';
import 'package:flutter_repository/views/animated_drawer.dart';
import 'package:flutter_repository/views/boat_app_ui/boat_app.dart';
import 'package:flutter_repository/views/circlura_floating_pop_out_menu.dart';
import 'package:flutter_repository/views/floating_pop_out_menu.dart';
import 'package:flutter_repository/views/listview_with_page_view_transformed.dart';
import 'package:flutter_repository/views/notification_listener_with_listview.dart';
import 'package:flutter_repository/views/profile_in_app_bar.dart';
import 'package:flutter_repository/views/transformed_card.dart';

// ====== =======   CustomButton ========= ===== ===== =========//
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.iconData,
    required this.forgroundString,
    required this.onPressed,
    required this.backGroundColor,
  });
  final IconData iconData;
  final String forgroundString;
  final void Function() onPressed;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 48.0, 
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            Expanded(
              child: Center(
                child: Text(
                  forgroundString,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

// =============   Navigation list ============================//

List<CustomButton> screenLists(BuildContext context) {
  return [
    // -----------  NotificationListener && ScrollController ---------------//
    CustomButton(
      backGroundColor: Colors.primaries[0],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(
            context, const NotificationListenerWithListView());
      },
      forgroundString: " NotificationListener && ScrollController",
      iconData: Icons.recommend_sharp,
    ),

    // -----------   Animated Drawer !  ---------------//
    CustomButton(
      backGroundColor: Colors.primaries[1],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(
            context, const AnimatedDrawerScreen());
      },
      forgroundString: " Animated Drawer ! ",
      iconData: Icons.heart_broken_outlined,
    ),

    // -----------   Floatin PopOut Menu !  ---------------//

    CustomButton(
      backGroundColor: Colors.primaries[2],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(
            context, const FloatingPopOutMenuScreen());
      },
      forgroundString: " Floatin PopOut Menu ! ",
      iconData: Icons.recommend_sharp,
    ),

    // -----------   Transformed Card !  ---------------//

    CustomButton(
      backGroundColor: Colors.primaries[2],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(
            context, const TransformedCardScreen());
      },
      forgroundString: " Transformed Card ! ",
      iconData: Icons.auto_awesome_outlined,
    ),

    // -----------   Circular Floating PopOut Menu !  ---------------//

    CustomButton(
      backGroundColor: Colors.primaries[3],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(
            context, const CircularFloatingPopOutMenuScreen());
      },
      forgroundString: " Circular Floating PopOut Menu ! ",
      iconData: Icons.auto_awesome_outlined,
    ),

    // -----------   Profile in App Bar ! ---------------//

    CustomButton(
      backGroundColor: Colors.primaries[4],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(context, const ProfileInAppBar());
      },
      forgroundString: " Profile in App Bar !",
      iconData: Icons.waving_hand_outlined,
    ),
    // -----------  AnimatedCircPopOutFloating ! ---------------//

    CustomButton(
      backGroundColor: Colors.primaries[5],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(
            context, const AnimatedCircPopOutFloating());
      },
      forgroundString: " AnimatedCircPopOutFloating !",
      iconData: Icons.widgets_outlined,
    ),

      // -----------  AnimatedCircPopOutFloating ! ---------------//

    CustomButton(
      backGroundColor: Colors.primaries[6],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(
            context, const BoatUiScreen());
      },
      forgroundString: " BoatUiScreen !",
      iconData: Icons.widgets_outlined,
    ),

    // -----------  AnimatedCircPopOutFloating ! ---------------//
  
     CustomButton(
      backGroundColor: Colors.primaries[6],
      onPressed: () {
        AppNavigatorFunctions.defaultPush(
            context, const ListViewWithPageViewTransformed());
      },
      forgroundString: "PageView & Transform for ListView !",
      iconData: Icons.widgets_outlined,
    ),
  ];
}
