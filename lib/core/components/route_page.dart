import 'package:flutter/material.dart';

import 'package:flutter_repository/core/constants/constant_strings.dart';
import 'package:flutter_repository/views/zoom_drawer_ext_pack.dart';
import 'package:flutter_repository/list_card_animation/list_card_animation.dart';
import 'package:flutter_repository/list_card_animation/sub_list_card.dart';
import 'package:flutter_repository/transform/transform_one.dart';

import '../../home_screen.dart';


class AppRoutePage {
  static Route? onRoutePage(RouteSettings setting) {
    switch (setting.name) {
      case Navigator.defaultRouteName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case ScreenName.drawerScreen:
        return MaterialPageRoute(
          builder: (_) => const ZoomDrawerScreen(),
        );

      case ScreenName.cardListAnimation:
        return MaterialPageRoute(
          builder: (_) => const CardListAnimation(),
        );

      case ScreenName.subCategories:
        return MaterialPageRoute(
          builder: (_) => const SubCategories(),
        );

      case ScreenName.transformOne:
        return MaterialPageRoute(
          builder: (_) => const TransformOne(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Route NOT FOUND !'),
              ),
              body: const Text('Route NOT FOUND !'),
            );
          },
        );
    }
  }
}


// ======================= Another method ==============================//

// class RoutePage {
//   static Route? onRoutePage(RouteSettings setting) {
//     if (setting.name == Navigator.defaultRouteName) {
//       return MaterialPageRoute(
//         builder: (_) => const HomeScreen(),
//       );
//     } else if (setting.name == ScreenName.drawerScreen) {
//       return MaterialPageRoute(
//         builder: (_) => const ZoomDrawerScreen(),
//       );
//     } else if (setting.name == ScreenName.cardListAnimation) {
//       return MaterialPageRoute(
//         builder: (_) => const CardListAnimation(),
//       );
//     } else if (setting.name == ScreenName.subCategories) {
//       return MaterialPageRoute(
//         builder: (_) => const SubCategories(),
//       );
//     } else if (setting.name == ScreenName.transformOne) {
//       return MaterialPageRoute(
//         builder: (_) => const TransformOne(),
//       );
//     }
//     // ====================== if route not founded ================//
//     else {
//       return MaterialPageRoute(
//         builder: (_) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Route NOT FOUND !'),
//             ),
//             body: const Text('Route NOT FOUND !'),
//           );
//         },
//       );
//     }
//     // ====================== if route not founded ================//
//   }
// }
