import 'package:flutter/material.dart';
import 'package:flutter_repository/views/zoom_drawer_ext_pack.dart';
import 'package:flutter_repository/list_card_animation/list_card_animation.dart';
import 'package:flutter_repository/list_card_animation/sub_list_card.dart';
import 'package:flutter_repository/views/animation/custom_implict_animation_or_tween_animation.dart';

import '../../../home_screen.dart';


// ---------------------- the first step ----------------------//
class AppScreenName{
static const String homeSearch = '/homeSearch';
static const String zoomDrawerScreen = '/zoomdrawerScreen';
static const String  cardListAnimation = '/cardListAnimation';
static const String  subCategories = '/subCategories';
static const String customImplictOrTweenAnimation = '/CustomImplictOrTweenAnimation';
}

// ---------------------- the second step ----------------------//
class AppRoutePage {
  static Route? onRoutePage(RouteSettings setting) {
    switch (setting.name) {
      case Navigator.defaultRouteName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case AppScreenName.zoomDrawerScreen:
        return MaterialPageRoute(
          builder: (_) => const ZoomDrawerScreen(),
        );

      case AppScreenName.cardListAnimation:
        return MaterialPageRoute(
          builder: (_) => const CardListAnimation(),
        );

      case AppScreenName.subCategories:
        return MaterialPageRoute(
          builder: (_) => const SubCategories(),
        );

      case AppScreenName.customImplictOrTweenAnimation:
        return MaterialPageRoute(
          builder: (_) => const CustomImplictOrTweenAnimation(),
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
