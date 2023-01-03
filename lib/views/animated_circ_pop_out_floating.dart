import 'package:flutter/material.dart';

class AnimatedCircPopOutFloating extends StatefulWidget {
  const AnimatedCircPopOutFloating({super.key});

  @override
  State<AnimatedCircPopOutFloating> createState() =>
      _AnimatedCircPopOutFloatingState();
}

class _AnimatedCircPopOutFloatingState extends State<AnimatedCircPopOutFloating>
    with SingleTickerProviderStateMixin {
  // ==================================== //
  late AnimationController animationController;
  late Animation degOneTranslationAnimation;
  late Animation rotationAnimation;
  // ==================================== //

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    //
    degOneTranslationAnimation = TweenSequence(<TweenSequenceItem>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.5), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.5, end: 1.0), weight: 25.0)
    ]).animate(animationController);
    //

    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInExpo));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  bool isOpend = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Circ PopOut Floating ! "),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            //=====================================//
            Positioned(
              right: 100.0,
              bottom: 200.0,
              child: Stack(
                children: <Widget>[
                  // Offset.fromDirection :: [direction => radian] , [distance => double]
                  Transform.translate(
                    offset: Offset.fromDirection(
                      getRadiansFromDegree(270),
                      degOneTranslationAnimation.value * 100,
                    ),
                    child: Transform(
                      alignment: AlignmentDirectional.center,
                      transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value),
                      )..scale(degOneTranslationAnimation.value),
                      child: CirclarButton(
                          width: 50,
                          height: 50,
                          onClick: () {},
                          iconData: Icons.settings,
                          color: Colors.greenAccent.shade400),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(
                      getRadiansFromDegree(225),
                      degOneTranslationAnimation.value * 100,
                    ),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value),
                      )..scale(degOneTranslationAnimation.value),
                      child: CirclarButton(
                          width: 50,
                          height: 50,
                          onClick: () {},
                          iconData: Icons.camera_alt_outlined,
                          color: Colors.black),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(
                      getRadiansFromDegree(180),
                      degOneTranslationAnimation.value * 100,
                    ),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degOneTranslationAnimation.value),
                      child: CirclarButton(
                          width: 50,
                          height: 50,
                          onClick: () {
                           // print("object");
                          },
                          iconData: Icons.person,
                          color: Colors.pink),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value),
                    ),
                    alignment: Alignment.center,
                    child: CirclarButton(
                        width: 60,
                        height: 60,
                        onClick: () {
                          if (animationController.isCompleted) {
                            animationController.reverse();
                            setState(() {
                              isOpend = false;
                            });
                          } else {
                            animationController.forward();
                            setState(() {
                              isOpend = true;
                            });
                          }
                        },
                        iconData: isOpend ? Icons.close : Icons.menu,
                        color: Colors.redAccent.shade700),
                  ),
                ],
              ),
            ),

            ///=====================================//
          ],
        ),
      ),

      ///============== Floating Action Button =======================//
      floatingActionButton: Stack(
        children: <Widget>[
          // Offset.fromDirection :: [direction => radian] , [distance => double]
          Positioned(
            bottom: degOneTranslationAnimation.value * 100,
            right: 0.0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value),
              )..scale(degOneTranslationAnimation.value),
              child: CirclarButton(
                  width: 50,
                  height: 50,
                  onClick: () {
                   // print("sddsd");
                  },
                  iconData: Icons.add,
                  color: Colors.blue),
            ),
          ),
          /////////////////////////////////////////////
          Positioned(
            bottom: degOneTranslationAnimation.value * 67,
            right: degOneTranslationAnimation.value * 70,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value),
              )..scale(degOneTranslationAnimation.value),
              child: CirclarButton(
                  width: 50,
                  height: 50,
                  onClick: () {},
                  iconData: Icons.camera_alt,
                  color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: degOneTranslationAnimation.value * 100,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value),
              )..scale(degOneTranslationAnimation.value),
              child: CirclarButton(
                  width: 50,
                  height: 50,
                  onClick: () {},
                  iconData: Icons.person,
                  color: Colors.orange),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Transform(
              transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value),
              ),
              alignment: Alignment.center,
              child: CirclarButton(
                  width: 60,
                  height: 60,
                  onClick: () {
                    if (animationController.isCompleted) {
                      animationController.reverse();
                      setState(() {
                        isOpend = false;
                      });
                    } else {
                      animationController.forward();
                      setState(() {
                        isOpend = true;
                      });
                    }
                  },
                  iconData: isOpend ? Icons.close : Icons.menu,
                  color: Colors.red),
            ),
          ),
        ],
      ),

      ///=====================================//,
    );
  }
}

//========== Circlar Floating Button
class CirclarButton extends StatelessWidget {
  final double width;
  final double height;
  final void Function() onClick;
  final IconData iconData;
  final Color color;

  const CirclarButton(
      {super.key,
      required this.width,
      required this.height,
      required this.onClick,
      required this.iconData,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(
        onPressed: onClick,
        icon: Icon(
          iconData,
          color: Colors.white,
        ),
        // enableFeedback: true,
      ),
    );
  }
}

double getRadiansFromDegree(double degree) {
  // 180 ---->  pi
  // degree ---> x
  // x =(pi*degree)/180
  // x = degree/(180/pi)
  // x = degree/57.29577951308
  double unitRadian = 57.29577951308;

  return degree / unitRadian;
}
