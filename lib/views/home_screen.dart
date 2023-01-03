
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Simple Flutter challenges !"),
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.white,
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20.0,
//               ),
//               CustomButton(
//                 backGroundColor: Colors.primaries[0],
//                 onPressed: () {
//                   AppNavigatorFunctions.defaultPush(
//                       context, const NotificationListenerWithListView());
//                 },
//                 forgroundString: " NotificationListener && ScrollController",
//                 iconData: Icons.recommend_sharp,
//               ),
//               const SizedBox(height: 12.0),
//               ////////////////////////
//               CustomButton(
//                 backGroundColor: Colors.primaries[1],
//                 onPressed: () {
//                   AppNavigatorFunctions.defaultPush(
//                       context, const AnimatedDrawerScreen());
//                 },
//                 forgroundString: " Animated Drawer ! ",
//                 iconData: Icons.heart_broken_outlined,
//               ),

//               ///
//                const SizedBox(height: 12.0),
//               CustomButton(
//                 backGroundColor: Colors.primaries[2],
//                 onPressed: () {
//                   AppNavigatorFunctions.defaultPush(
//                       context, const FloatingPopOutMenuScreen());
//                 },
//                 forgroundString: " Floatin PopOut Menu ! ",
//                 iconData: Icons.recommend_sharp,
//               ),
//               /////////////////////////
//               const SizedBox(height: 12.0),
//               CustomButton(
//                 backGroundColor: Colors.primaries[2],
//                 onPressed: () {
//                   AppNavigatorFunctions.defaultPush(
//                       context, const TransformedCardScreen());
//                 },
//                 forgroundString: " Transformed Card ! ",
//                 iconData: Icons.auto_awesome_outlined,
//               ),
//               /////////////////////////
//               const SizedBox(height: 12.0),
//               CustomButton(
//                 backGroundColor: Colors.primaries[3],
//                 onPressed: () {
//                   AppNavigatorFunctions.defaultPush(
//                       context, const CircularFloatingPopOutMenuScreen());
//                 },
//                 forgroundString: " Circular Floating PopOut Menu ! ",
//                 iconData: Icons.auto_awesome_outlined,
//               ),
//               /////////////////////////
//               const SizedBox(height: 12.0),
//               CustomButton(
//                 backGroundColor: Colors.primaries[4],
//                 onPressed: () {
//                   AppNavigatorFunctions.defaultPush(
//                       context, const ProfileInAppBar());
//                 },
//                 forgroundString: " Profile in App Bar !",
//                 iconData: Icons.waving_hand_outlined,
//               ),
//               /////////////////////////
//               ///  /////////////////////////
//               const SizedBox(height: 12.0),
//               CustomButton(
//                 backGroundColor: Colors.primaries[5],
//                 onPressed: () {
//                   AppNavigatorFunctions.defaultPush(
//                       context, const AnimatedCircPopOutFloating());
//                 },
//                 forgroundString: " AnimatedCircPopOutFloating !",
//                 iconData: Icons.widgets_outlined,
//               ),
//               /////////////////////////
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
