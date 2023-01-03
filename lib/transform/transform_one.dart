

import 'package:flutter/material.dart';

class TransformOne extends StatefulWidget {
  const TransformOne({Key? key}) : super(key: key);

  @override
  State<TransformOne> createState() => _TransformOneState();
}

class _TransformOneState extends State<TransformOne> {
  //==========================================//
  bool isExpanded = false;

  //============================================//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('transform learning')),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //=======  =========    ==================//
                GestureDetector(
                  onTap: (){
                    setState(() {
                      
                      isExpanded?isExpanded=false:isExpanded=true;
                    });
                  },
                  child: AnimatedContainer(
                   curve: Curves.easeInExpo,
                    duration: const Duration(milliseconds:500),
                    height: isExpanded?100: 200,
                    width: isExpanded?100: 200,
                    child: Container(
                          color: Colors.red,
                               
                    )),
                )
         
              //=======  =========   ================//
            ],
          ),
        ),
      ),
    );
  }
}
