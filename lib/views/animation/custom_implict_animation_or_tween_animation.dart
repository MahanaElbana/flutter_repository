import 'dart:math';

import 'package:flutter/material.dart';

class CustomImplictOrTweenAnimation extends StatefulWidget {
  const CustomImplictOrTweenAnimation({super.key});

  @override
  State<CustomImplictOrTweenAnimation> createState() => _TransformOneState();
}

class _TransformOneState extends State<CustomImplictOrTweenAnimation> {
  //==========================================//
  double scaleValue = 1;
  double translateValue = 100;

  double convertDegreeToRadian(double degree) {
    const double pi = 3.1415926535897932;
    return (pi * degree) / 180;
  }

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
              const SizedBox(
                height: 30,
              ),

              //======== ======== Transform ============= ========//
              Transform(
                transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(pi/5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(1.0)),
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 30),
              //=======  =========    ==================//
              GestureDetector(
                onTap: () {
                  if (scaleValue == 1) {
                    setState(() {
                      scaleValue = 0.1;
                    });
                  } else {
                    setState(() {
                      scaleValue = 1;
                    });
                  }
                },
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.1, end: scaleValue),
                  duration: const Duration(milliseconds: 350),
                  child: Container(
                    color: Colors.green,
                    height: 300,
                    width: 300,
                  ),
                  builder: (context, double scaleValue, child) {
                    return Transform.scale(
                      scale: scaleValue,
                      child: child,
                    );
                  },
                ),
              ),
              //= === = ==  === == === =  === === ==== == ===//
              const SizedBox(
                height: 120,
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: translateValue),
                duration: const Duration(milliseconds: 350),
                child: Container(
                  color: Colors.yellow,
                  height: 40,
                  width: 40,
                ),
                builder: (context, double value, child) {
                  return Transform.translate(
                    offset:
                        Offset.fromDirection(convertDegreeToRadian(270), value),
                    child: child,
                  );
                },
              ),
              IconButton(
                  onPressed: () {
                    if (translateValue == 100) {
                      setState(() {
                        translateValue = 0.1;
                      });
                    } else {
                      setState(() {
                        translateValue = 100;
                      });
                    }
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
