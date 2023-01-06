/// example on types of animations
import 'dart:math';

import 'package:flutter/material.dart';

class FultterExplicitAnimation extends StatefulWidget {
  @override
  _FultterExplicitAnimationState createState() =>
      _FultterExplicitAnimationState();
}

class _FultterExplicitAnimationState extends State<FultterExplicitAnimation>
    with SingleTickerProviderStateMixin {
  //////// variables /////////
  late AnimationController _animationController;
  late Animation<TextStyle> _animation;
  double height = 30.0;
  double width = 30.0;
  double _angle = 0.0;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        lowerBound: 0.0,
        upperBound: 1.0)
      ..repeat(reverse: true);

    _animation = TextStyleTween(
            begin: TextStyle(color: Colors.green, fontSize: 25),
            end: TextStyle(color: Colors.blue, fontSize: 35))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeIn));
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("explicit"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //// ////// //// ////     built in implicit nanimation //// //// ///
            AnimatedContainer(
              duration: Duration(seconds: 2),
              color: Colors.black,
              curve: Curves.linear,
              height: height,
              width: width,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    width = Random().nextInt(400).toDouble();
                    height = Random().nextInt(400).toDouble();
                  });
                },
                child: Text("built in implicit")),

            ////////// ///// ///// Custom implicit animation   ///// //// ////
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: _angle),
              duration: Duration(seconds: 2),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
              builder: (_, angl, child) => Transform.rotate(
                angle: angl,
                child: child,
              ),
            ),
            Slider(
              min: 0.0,
              max: pi * 2,
              divisions: 4,
              value: _angle,
              onChanged: (value) {
                setState(() {
                  _angle = value;
                });
              },
            ),
            ////////////   built in explicit animation  ///// /// // // /
            DefaultTextStyleTransition(
              style: _animation,
              child: Text("oky yadonya"),
            ),
            Center(
                // ignore: deprecated_member_use
                child: DefaultTextTrasition(textStyleWithMy: _animation)),
            SizedBox(
              height: 12,
            ),
            Center(
                // ignore: deprecated_member_use
                child: OutlineButtonTrasition(
              width: _animationController,
            )),
          ],
        ),
      ),
    );
  }
}

////////////////  custom explicit animation
class OutlineButtonTrasition extends AnimatedWidget {
  OutlineButtonTrasition({width}) : super(listenable: width);

  Animation<double> get width => listenable as Animation<double>;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return TextButton(
      onPressed: () {},
      child: Text("custom explicit animation "),
      //borderSide: BorderSide(width: width.value * 5),
    );
  }
}

///////////////////  custom explicit animation
class DefaultTextTrasition extends AnimatedWidget {
  DefaultTextTrasition({textStyleWithMy}) : super(listenable: textStyleWithMy);

  // get to get value from listenable and make update on textStyleWithMy
  Animation<TextStyle> get textStyleWithMy =>
      listenable as Animation<TextStyle>;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: textStyleWithMy.value,
      child: Text("custom explicit animation "),
    );
  }
}
