import 'dart:math';

import 'package:flutter/material.dart';

class ListViewWithPageViewTransformed extends StatefulWidget {
  const ListViewWithPageViewTransformed({super.key});

  @override
  State<ListViewWithPageViewTransformed> createState() =>
      _ListViewWithPageViewTransformedState();
}

class _ListViewWithPageViewTransformedState
    extends State<ListViewWithPageViewTransformed> {
  PageController pageController = PageController(viewportFraction: 0.6);
  double currentPageValue = 0.0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(_listenerController);
  }

  void _listenerController() {
    setState(() {
      currentPageValue = pageController.page!.toDouble();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    pageController.removeListener(_listenerController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView With PageView Transformed "),
      ),
      body: Stack(
       
          children: [
               // ------------------------//
          Positioned.fill(
            child: Container(
              color: Colors.cyan.withOpacity(0.9),
            ),
          ),
          // ------------------------//
            PageView.builder(
                  controller: pageController,
                  itemCount: 60,
                  itemBuilder: (context, position) {
                    //print("$currentPageValue --- $position");

                    // ------------- //
                    if (position == currentPageValue) {
                      return Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1,
                            child: Container(
                              height: size.height*0.45,
                               width: size.width*0.85,
                              color: Colors
                                  .primaries[position % (Colors.primaries.length)],
                            ),
                          ),
                        ],
                      );
                    }
                    // -----------//
                    else if (position < currentPageValue) {
                      return Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: max(1 - (currentPageValue - position), 0.5),
                            child: Container(
                                 height: size.height*0.45,
                              width: size.width*0.85,
                              color: Colors
                                  .primaries[position % (Colors.primaries.length)],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: max(1 - (position - currentPageValue), 0.5),
                            child: Container(
                                height: size.height*0.45,
                              width: size.width*0.85,
                              color: Colors
                                  .primaries[position % (Colors.primaries.length)],
                            ),
                          ),
                        ],
                      );
                    }
                  }),
          ],
        ),
        
     
    );
  }
}
