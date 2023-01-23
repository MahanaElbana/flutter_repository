


// import 'dart:convert';

// import 'package:bloc_shared_pref/model/news.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // b08c446ebcc74bbeb072a5e2ebdc02f6
// // https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=b08c446ebcc74bbeb072a5e2ebdc02f6
// class AnimatedListScreen extends StatefulWidget {
//   const AnimatedListScreen({super.key});

//   @override
//   State<AnimatedListScreen> createState() => _AnimatedListScreenState();
// }

// class _AnimatedListScreenState extends State<AnimatedListScreen> {
//   ////////////////////////////////////////////////////////
//   Future<List<NewsModel>> getNewsData() async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=b08c446ebcc74bbeb072a5e2ebdc02f6";
//     Uri uri = Uri.parse(url);
//     var request = await http.get(uri);
//     var data = request.body;
//     List<dynamic> mapData = json.decode(data)['articles'];
//     List<NewsModel> newsModels =
//         mapData.map((e) => NewsModel.fromJson(e)).toList();
//     return newsModels;
//   }

//   @override
//   void initState() {
//     getNewsData();
//     super.initState();
//   }

//   /////////////////////////////////////////////////////////////
//   final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

//   List<int> items = [];

//   int counter = 0;

//   int index = 0;
//   final ScrollController scrollController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Animated List Screen"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: AnimatedList(
//               key: listKey,
//               initialItemCount: items.length,
//               controller: scrollController,
//               itemBuilder: (context, index, animation) {
//                 int item = items[index];

//                 return SlideTransition(
//                   position: Tween<Offset>(
//                     begin: const Offset(-1, 0),
//                     end: const Offset(0, 0),
//                   ).animate(animation),
//                   child: SizedBox(
//                     // Actual widget to display
//                     height: 128.0,
//                     child: Card(
//                       color: Colors.primaries[item % Colors.primaries.length],
//                       child: Center(
//                         child: Text('Item $item'),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     listKey.currentState!.insertItem(0,
//                         duration: const Duration(milliseconds: 500));
//                     items = []
//                       ..add(counter++)
//                       ..addAll(items);
//                     Future.delayed(
//                       Duration(milliseconds: 300),
//                       () {
//                         return scrollController.animateTo(
//                             scrollController.position.minScrollExtent,
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.bounceOut);
//                       },
//                     );
//                   },
//                   icon: Icon(Icons.add)),
//               //
//               IconButton(
//                   onPressed: () {
//                     // int item = items[0];
//                     int item = items.removeAt(0);
//                     listKey.currentState!.removeItem(
//                         0,
//                         (_, animation) => SlideTransition(
//                               position: Tween<Offset>(
//                                 begin: const Offset(-1, 0),
//                                 end: const Offset(0, 0),
//                               ).animate(animation),
//                               child: SizedBox(
//                                 // Actual widget to display
//                                 height: 128.0,
//                                 child: Card(
//                                   color: Colors.primaries[
//                                       item % Colors.primaries.length],
//                                   child: Center(
//                                     child: Text('Item $item '),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         duration: const Duration(milliseconds: 500));
//                   },
//                   icon: Icon(Icons.remove)),
//               //
//             ],
//           ),
//         ],
//       ),
//       ///////////
//       // bottomNavigationBar: NavigationBarTheme(
//       //   data: NavigationBarThemeData(
//       //     labelTextStyle: MaterialStateProperty.resolveWith(
//       //       (states) => const TextStyle(fontSize: 14.0 ,color: Colors.black),
//       //     ),
//       //     indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//       //      indicatorColor: Colors.greenAccent.shade200
//       //   ),
//       //   child: NavigationBar(
//       //     labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
//       //     onDestinationSelected: (value) {
//       //       setState(() {
//       //         index = value;
//       //       });
//       //     },
//       //    height: 66 ,
//       //     selectedIndex: index,
//       //     animationDuration: const Duration(seconds: 1),
//       //     destinations: const [
//       //       NavigationDestination(
//       //         icon: Icon(Icons.email_outlined),
//       //         label: "email",
//       //         selectedIcon: Icon(Icons.email),
//       //       ),
//       //       NavigationDestination(
//       //         icon: Icon(Icons.home_outlined),
//       //         label: "home",
//       //         selectedIcon: Icon(Icons.home),
//       //       ),
//       //        NavigationDestination(
//       //         icon: Icon(Icons.person_outline_outlined),
//       //         label: "person",
//       //         selectedIcon: Icon(Icons.person),
//       //       ),
//       //       NavigationDestination(
//       //         icon: Icon(Icons.settings_suggest_outlined),
//       //         label: "settings",
//       //         selectedIcon: Icon(Icons.settings_suggest),
//       //       ),
//       //     ],
//       //   ),
//       // ),

//       ///
//       bottomNavigationBar: BottomNavigationBar(
//           onTap: (value) {
//             setState(() {
//               index = value;
//             });
//           },
//           backgroundColor: Colors.green,
//           currentIndex: index,
//           selectedItemColor: Colors.red,
//           unselectedItemColor: Colors.grey,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.add,
//               ),
//               label: "home",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add),
//               label: "settings",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add),
//               label: "remove",
//             ),
//           ]),
//     );
//   }
// }



