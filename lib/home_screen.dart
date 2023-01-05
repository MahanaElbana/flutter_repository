import 'package:flutter/material.dart';
import 'package:flutter_repository/core/components/navigator_route_button/custom_button.dart';
import 'package:flutter_repository/core/components/navigator_route_button/navigation.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /// ==================== '''appBar''' =================///
      appBar: AppBar(title: const  Text("The main Page")),
      /// ==================== '''body''' =================///
      body: Container(
        margin: const EdgeInsets.only(top: 8.0),
        alignment: Alignment.topCenter,
         child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // children: <Widget>[
          //   ...allAlgorithms(context).map((e) => e).toList(),
          //   ...allAlgorithms(context).toList(),
          //   ...allAlgorithms(context)
          // ]
          
          // children: screenLists(context),
          children: [ 
            // ============ the first method ===========//
            ...screenLists(context),
            ...screenListsOne(context),
            // ============ the second method ===========//
            // ============ the end  ===========//
            
            ],
        )
        ),
      ),

      /// ==================== '''body endded''' =================///
    );
  }
}
