import 'package:flutter/material.dart';
import 'package:flutter_repository/views/animation_conclusion/code_based_animation/implicit/built_in_implicit_animation/task_on_animated_foo.dart';

//
class BuiltInImplicitAnimation extends StatefulWidget {
  const BuiltInImplicitAnimation({super.key});

  @override
  State<BuiltInImplicitAnimation> createState() =>
      _BuiltInImplicitAnimationState();
}

class _BuiltInImplicitAnimationState extends State<BuiltInImplicitAnimation> {
  // ---------- variables && functions  ---------------//
  bool status = false;
  void toggleSelectionState() {
    setState(() {
      status = !status;
    });
  }

  // ---------------- variables && functions ----------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ------------------ [AppBar] --------------------//
      appBar: AppBar(
        title: const Text(
          "BuiltInImplicitAnimation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      /// ------------------ [body] --------------------//
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 23.0),
              // ---------------- CustomAnimatedContainer ---------------------- //
              CustomAnimatedContainer(status: status),
              const SizedBox(height: 23.0),
              // ---------------- CustomAnimatedOpacity ---------------------- //
              CustomAnimatedOpacity(status: status),
              const SizedBox(height: 23.0),
              // ---------------- CustomAnimatedCrossFade ---------------------- //
              CustomAnimatedCrossFade(status: status),
              const SizedBox(height: 23.0),

              // ---------------- ACTION BUTTON ---------------------- //
              CustomOutlinedButton(
                forgroundString: 'Animate the widgets',
                onPressed: toggleSelectionState,
              ),
              const SizedBox(height: 23.0),
              // ---------------- ACTION BUTTON ---------------------- //
              CustomOutlinedButton(
                forgroundString: 'go to the task',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnBoardingScreenTask(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///  - [built-in implicit] animation
///      - such as the [nimatedContainer] widget,
///      - which is easy to handle and has a ready-made widget.

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    required this.status,
  });

  final bool status;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: status ? const Size(100, 30).height : const Size(30, 30).height,
      width: status ? const Size(100, 30).width : const Size(30, 30).width,
      duration: const Duration(seconds: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: status ? Colors.blueAccent.shade700 : Colors.grey.shade300,
      ),
    );
  }
}

class CustomAnimatedOpacity extends StatelessWidget {
  const CustomAnimatedOpacity({
    super.key,
    required this.status,
  });

  final bool status;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: status ? 1 : 0.2,
      duration: const Duration(milliseconds: 1100),
      curve: Curves.easeInExpo,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.amberAccent.shade700,
        ),
      ),
    );
  }
}

class CustomAnimatedCrossFade extends StatelessWidget {
  const CustomAnimatedCrossFade({
    super.key,
    required this.status,
  });

  final bool status;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: Alignment.center,
      firstCurve: Curves.easeInCubic,
      secondCurve: Curves.bounceOut,
      reverseDuration: const Duration(seconds: 3),
      firstChild: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.amberAccent.shade700,
        ),
        child: Center(
          child: Text(
            "first child",
            style: TextStyle(
              color: Colors.blueAccent.shade700,
            ),
          ),
        ),
      ),
      secondChild: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blueAccent.shade700,
        ),
        child: Center(
          child: Text(
            "second child",
            style: TextStyle(
              color: Colors.amberAccent.shade700,
            ),
          ),
        ),
      ),
      crossFadeState:
          status ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(seconds: 2),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String forgroundString;
  const CustomOutlinedButton({
    super.key,
    required this.onPressed, required this.forgroundString,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        alignment: Alignment.center,
        minimumSize: const Size(220, 45.0),
        shadowColor: Colors.blueGrey.shade300,
        side: const BorderSide(width: 1.5),
      ),
      child:  Text(
        forgroundString,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
