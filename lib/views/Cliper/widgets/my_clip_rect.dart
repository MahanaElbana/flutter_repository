import 'package:flutter/material.dart';

/// ============ The first Method to use [ClipRRect Widget] ============ ///

class MyFirstCliRectWidget extends StatelessWidget {
  final double? radius;

  const MyFirstCliRectWidget({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: MyClipRect(radius: radius ?? 20), // MyClipRRect

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

class MyClipRect extends CustomClipper<Rect> {
  final double radius;
  MyClipRect({required this.radius});
  @override
  Rect getClip(Size size) {
   Rect rRect = Rect.fromLTRB(0, 0, radius, radius);
    
    // Rect.fromLTWH(0, 0, radius, radius);

    // Rect.fromPoints(
    //   const Offset(0, 0),  // FROM
    //   Offset(radius ,radius ), //TO
    // );

    // Rect.fromCircle(
    //   center: Offset(size.width / 2, size.height / 2),
    //   radius: radius,
    // );

    // Rect.fromCenter(
    //   center: Offset(size.width / 2, size.height / 2),
    //   height: radius,
    //   width: radius,
    // );

    return rRect;
  }

  @override
  bool shouldReclip(MyClipRect oldClipper) {
    return (oldClipper.radius != radius);
  }
}

extension MyMediaQuerValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
}
