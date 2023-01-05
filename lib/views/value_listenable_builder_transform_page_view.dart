import 'dart:math';

import 'package:flutter/material.dart';

class ValueListenableBuilderTransformPageView extends StatefulWidget {
  const ValueListenableBuilderTransformPageView({super.key});

  @override
  State<ValueListenableBuilderTransformPageView> createState() =>
      _ValueListenableBuilderTransformPageViewState();
}

class _ValueListenableBuilderTransformPageViewState
    extends State<ValueListenableBuilderTransformPageView> {

  //--------- pageController     
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.6);
  //--------- value notifier    
  ValueNotifier<double> valueNotifierScroll = ValueNotifier(0.0);
  
  //--------- initState
  @override
  void initState() {
    pageController.addListener(_addLisenterController);
    super.initState();
  }
  
  //--------- add listener
  void _addLisenterController() {
    valueNotifierScroll.value = pageController.page!.toDouble();
  }
  //--------- add dispose 
  @override
  void dispose() {
    pageController.removeListener(_addLisenterController);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text("ValueListenableBuilder Transform PageView ")),
      body: Stack(
        children: [
          // ------------------------//
          Positioned.fill(
            child: Container(
              color: Colors.cyan.withOpacity(0.9),
            ),
          ),
          // ------------------------//
          ValueListenableBuilder(
            valueListenable: valueNotifierScroll,
            builder: (context, value, child) {
              return PageView.builder(
                  controller: pageController,
                  itemCount: 60,
                  itemBuilder: (context, position) {
                    // print("$value --- $position");

                    // ------------- //
                    if (position == value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1,
                            child: Container(
                              height: size.height * 0.45,
                              width: size.width * 0.85,
                              color: Colors.primaries[
                                  position % (Colors.primaries.length)],
                            ),
                          ),
                        ],
                      );
                    }
                    // -----------//
                    else if (position < value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: max(1 - (value - position), 0.5),
                            child: Container(
                              height: size.height * 0.45,
                              width: size.width * 0.85,
                              color: Colors.primaries[
                                  position % (Colors.primaries.length)],
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
                            scale: max(1 - (position - value), 0.5),
                            child: Container(
                              height: size.height * 0.45,
                              width: size.width * 0.85,
                              color: Colors.primaries[
                                  position % (Colors.primaries.length)],
                            ),
                          ),
                        ],
                      );
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}
