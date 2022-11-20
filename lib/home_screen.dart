import 'package:flutter/material.dart';
import 'package:flutter_repository/components/navigation.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /// ==================== '''appBar''' =================///
      appBar: AppBar(
        title: const  Text("Route page"),
        centerTitle: true,
        backgroundColor:  Colors.amber,
      ),

      /// ==================== '''body''' =================///
      body: Container(
        margin: const EdgeInsets.only(top: 8.0),
        alignment: Alignment.topCenter,
        // child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // children: <Widget>[
          //   ...allAlgorithms(context).map((e) => e).toList(),
          //   ...allAlgorithms(context).toList(),
          //   ...allAlgorithms(context)
          // ]
          
         children: screenLists(context),

      
        ),
      ),

      /// ==================== '''body endded''' =================///
    );
  }
}
