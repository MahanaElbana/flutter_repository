import 'dart:math';

import 'package:flutter/material.dart';

class BoatUiScreen extends StatefulWidget {
  const BoatUiScreen({super.key});

  @override
  State<BoatUiScreen> createState() => _BoatUiScreenState();
}

class _BoatUiScreenState extends State<BoatUiScreen> {
  late PageController _pageController;
  ValueNotifier<double> pageNotifierScroll = ValueNotifier(0.0);

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1.0);
    _pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    pageNotifierScroll.value = (_pageController.page)!.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.9),
        elevation: 0.0,
        title: const Text("item view"),
      ),
      body: Stack(
        children: [
          // ------------------------//
          Positioned.fill(
            child: Container(
              color: Colors.green.withOpacity(0.9),
            ),
          ),
          // ------------------------//

          ValueListenableBuilder(
            valueListenable: pageNotifierScroll,
            builder: (context, value, _) {
              // print(value);

              return PageView.builder(
                controller: _pageController,
                itemCount: 30,
                itemBuilder: (context, index) {
                  double percentage = index - value;
                  double rotation = percentage.clamp(0.0, 1.0);
                  var fixRotation = pow(rotation, 0.35);
                  if (index == 1) {
                   // print(rotation);
                  }
                  return Opacity(
                    opacity: 1 - rotation,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                             // print(index);
                            },
                            child: Center(
                              child: Transform(
                                alignment: Alignment.centerLeft,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.002)
                                  ..rotateY(1.8 * fixRotation)
                                  ..translate(-rotation * size.width * 0.5)
                                  ..scale(1 + rotation * 0.5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.primaries[
                                          index % (Colors.primaries.length)],
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 50,
                                            offset: Offset(5.0, 5.0),
                                            spreadRadius: 6),
                                      ]),
                                  width: (size.width) * 0.7,
                                  height: (size.height) * 0.45,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          const Text(
                            "Mahney  Mohsen elbana",
                            style: TextStyle(fontSize: 26),
                          ),
                          const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              "Mahney  Mohsen elbana",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
          // ------------------------//

          ,
        ],
      ),
    );
  }
}
