import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_repository/views/Cliper/widgets/my_clip_rect.dart';
import 'package:flutter_repository/views/Cliper/widgets/my_clip_rrect.dart';

class CliperScreen extends StatefulWidget {
  const CliperScreen({super.key});

  @override
  State<CliperScreen> createState() => _CliperScreenState();
}

class _CliperScreenState extends State<CliperScreen> {
  double radius = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==================== app Bar =============//
      appBar: AppBar(
        title: const Text("Custom Clipper"),
      ),

      // ==================== body =============//
      body: SingleChildScrollView(
        child: Column(
          children: [
            //=====================//
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "  ## ClipRRect",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // ===================== //
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    radius = radius * 2;
                  });
                },
                child: MyFirstClipRRectWidget(
                  radius: radius,
                ),
              ),
            ),
            //========================//

            const SizedBox(height: 20),
            // ===================== //
            Center(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      radius = radius * 2;
                    });
                  },
                  child: MySecondClipRRectWidget(
                    radius: radius,
                  )),
            ),
            //=====================//
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "  ## ClipRect",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // ===================== //
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    radius = radius * 2;
                  });
                },
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: radius / 2, end: radius),
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.bounceInOut,
                  builder: (context, double value, _) {
                    return MyFirstCliRectWidget(radius: value);
                  },
                ),
              ),
            ),
            //=====================//
            //  ClipRect(

            //    child: Align(
            //      alignment: Alignment.topCenter,
            //      heightFactor: 0.5,
            //      widthFactor: 0.3,
            //      child: Container(
            //          width: 200, // MyMediaQuerValues
            //          height: 200, // MyMediaQuerValues
            //          decoration: const BoxDecoration(color: Colors.red),

            //     child: Text(
            //       "ClipRect Align",
            //       style: Theme.of(context)
            //           .textTheme
            //           .subtitle1!
            //           .copyWith(fontSize: 16, color: Colors.white),
            //           textAlign: TextAlign.center,
            //     ),

            //        ),
            //    ),
            //  ),

//=====================//
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
