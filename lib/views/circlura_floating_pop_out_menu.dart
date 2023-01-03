

import 'package:flutter/material.dart';

class CircularFloatingPopOutMenuScreen extends StatefulWidget {
  const CircularFloatingPopOutMenuScreen({super.key});

  @override
  State<CircularFloatingPopOutMenuScreen> createState() =>
      _CircularFloatingPopOutMenuScreenState();
}

class _CircularFloatingPopOutMenuScreenState
    extends State<CircularFloatingPopOutMenuScreen> {
  bool isOpend = false;
  String btnText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Circular Floating PopOut Menu"),
      ),
      body: Center(
        child: Text(btnText),
      ),
      //==================//
      floatingActionButton: 
         Stack(
          children: [
            // ==================== //
              Positioned(
                      bottom: 0.0,
                      right: 0.0,
                       child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                  borderRadius: BorderRadius.circular(27.5)),
              child: IconButton(
                icon: Icon(
                    isOpend == true
                        ? Icons.close
                        : Icons.menu,
                    color: Colors.white),
                onPressed: () {
                  setState(() {
                    isOpend = !isOpend;
                    btnText = "";
                  });
                },
              )),
            ),
      
            // ==================== //
            
                     Positioned(
                      bottom: 100,
                      right: 1,
                       child: Container(
                        height: isOpend ? 48 : 0,
                        width: isOpend ? 48 : 0,
                        decoration: BoxDecoration(
                            color: Colors.red.shade900,
                            borderRadius: BorderRadius.circular(24.0)),
                        child: IconButton(
                          icon: const Icon(Icons.home_filled, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              btnText = "Home";
                            });
                          },
                        ),
                                     
                         
                       
                                  ),
                     ),
            // =====================//
      
           // ==================== //
             if(isOpend == true)
             Positioned(
              bottom: 75,
              right: 75,
              
               child: Container(
                  height: isOpend ? 48 : 0,
                  width: isOpend ? 48 : 0,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade900,
                      borderRadius: BorderRadius.circular(24.0)),
                  
                  child: IconButton(
                    icon: const Icon(Icons.cabin, color: Colors.white),
                    onPressed: () {
                      setState(
                        () {
                          btnText = "WIFI";
                        },
                      );
                    },
                  ),
                ),
             ),
            
      
            // =====================//
      
            // ==================== //
             Positioned(
              bottom: 0,
              right: 100,
               child: Container(
                  height: isOpend ? 48 : 0,
                  width: isOpend ? 48 : 0,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade900,
                      borderRadius: BorderRadius.circular(24.0)),
                  child: IconButton(
                    icon: const Icon(Icons.wifi_lock_rounded, color: Colors.white),
                    onPressed: () {
                      setState(
                        () {
                          btnText = "WIFI";
                        },
                      );
                    },
                  ),
                ),
             ),
            
      
            // =====================//
          ],
        
      ),
    );
  }
}
