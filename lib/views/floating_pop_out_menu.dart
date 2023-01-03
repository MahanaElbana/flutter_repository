
import 'package:flutter/material.dart';
import 'package:flutter_repository/core/widgets/default_snack_bar_func.dart';

class FloatingPopOutMenuScreen extends StatefulWidget {
  const FloatingPopOutMenuScreen({super.key});

  @override
  State<FloatingPopOutMenuScreen> createState() =>
      _FloatingPopOutMenuScreenState();
}

class _FloatingPopOutMenuScreenState extends State<FloatingPopOutMenuScreen> {
  bool isOpend = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(" Floatin PopOut Menu ! "),
      ),
      floatingActionButton: isOpend
          ? Container(
              // -----------------//
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.17),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              // -----------------//
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: () {
                  
                      showDefaultSnackBar(context, "Home Screen !"); 
                      //============== snack bar ================//
                    },
                    icon: Icon(
                      Icons.house_outlined,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: () {
                      showDefaultSnackBar(context, "DashBoard Screen !"); 
                    },
                    icon: Icon(
                      Icons.dashboard_outlined,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: () {
                       showDefaultSnackBar(context, "Sells Screen !"); 
                    },
                    icon: Icon(
                      Icons.work_history_outlined,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: () {
                       showDefaultSnackBar(context, "Settings Screen !"); 
                    },
                    icon: Icon(
                      Icons.settings_suggest_outlined,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(10),
                    //--------------------------//
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    //--------------------------//
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          isOpend = !isOpend;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  isOpend = !isOpend;
                });
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
    );
  }
}
