import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vector_math/vector_math.dart' as vector;

class AnimatedOnBoardingScreen extends StatefulWidget {
  const AnimatedOnBoardingScreen({super.key});

  @override
  State<AnimatedOnBoardingScreen> createState() =>
      _AnimatedOnBoardingScreenState();
}

class _AnimatedOnBoardingScreenState extends State<AnimatedOnBoardingScreen> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.85);
  double page = 0.0;
  void _addListener() {
    setState(() {
      page = pageController.page!.toDouble();
    });
  }

  @override
  void initState() {
    pageController.addListener(_addListener);

    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(_addListener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height - appBarHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Animated On Boarding Screen"),
      ),
      body: Container(
        color: Colors.red,
        height: double.infinity,
        width: double.infinity,
        child: PageView.builder(
          itemCount: 20,
          controller: pageController,
          itemBuilder: (context, index) {
            double percentage = (index - page).abs().clamp(0.0, 1.0);
            double factor = pageController.position.userScrollDirection ==
                    ScrollDirection.forward
                ? 1.0
                : -1.0;
            double opacityPercentage = percentage.clamp(0.0, 0.7);
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(vector.radians(45 * factor * percentage)),
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Opacity(
                  opacity: 1 - opacityPercentage,
                  child: GestureDetector(
                    //-----------------------------//
                    onVerticalDragUpdate: (details) {
                      print(details.primaryDelta);
                      if (details.primaryDelta! < -7.0) {
                        Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 550),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: Scaffold(
                                body: Container(
                                  color: Colors.red,
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Hero(
                                        tag: "cont$index",
                                        child: Container(
                                          height: 400,
                                          width: double.infinity,
                                          color: Colors.green,
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Image.asset(
                                                    'assets/images/work.jpg',
                                                    fit: BoxFit.cover),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.arrow_back)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ));
                      }
                    },
                    //-----------------------------//
                    child: Column(
                      //mainAxisAlignment:  MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        Hero(
                          tag: "cont$index",
                          child: Container(
                            color: Colors.green,
                            width: screenSize.width * 0.8,
                            height: screenHeight * 0.3,
                            child: Image.asset('assets/images/work.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.07),
                        Container(
                          color: Colors.green,
                          width: screenSize.width * 0.8,
                          height: screenHeight * 0.55,
                          child: Image.asset('assets/images/work1.png',
                              fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
