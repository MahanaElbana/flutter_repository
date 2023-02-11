import 'package:flutter/material.dart';

/// ============ The first Method to use [ClipRRect Widget] ============ ///

class MyFirstClipRRectWidget extends StatelessWidget {
  final double? radius;

  const MyFirstClipRRectWidget({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipper: MyClipRRect(radius: radius ?? 20), // MyClipRRect
      child: Container(
        width: context.width / 2, // MyMediaQuerValues
        height: context.width / 2, // MyMediaQuerValues
        decoration: const BoxDecoration(color: Colors.red),
        child: Center(
          child: Text(
            "ClipRRect \n \nCustomCliper<RRect>",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class MyClipRRect extends CustomClipper<RRect> {
  final double radius;
  MyClipRRect({required this.radius});
  @override
  RRect getClip(Size size) {
    RRect rRect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      Radius.circular(radius),
    );
    return rRect;
  }

  @override
  bool shouldReclip(MyClipRRect oldClipper) {
    return (oldClipper.radius != radius);
  }
}

/// ============ The Second Method to use [ClipRRect Widget] ============ ///

class MySecondClipRRectWidget extends StatelessWidget {
  final double? radius;
  const MySecondClipRRectWidget({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 20),
      child: Container(
        width: context.width / 2, // MyMediaQuerValues
        height: context.width / 2, // MyMediaQuerValues
        decoration: BoxDecoration(color: Colors.greenAccent.shade700),
        child: Center(
          child: Text(
            "ClipRRect \n \n borderRadius",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

extension MyMediaQuerValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
}
