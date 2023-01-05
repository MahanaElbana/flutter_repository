import 'package:flutter/material.dart';

class CustomAnimatedOpacity extends StatefulWidget {
  const CustomAnimatedOpacity({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedOpacity> createState() => _CustomAnimatedOpacityState();
}

class _CustomAnimatedOpacityState extends State<CustomAnimatedOpacity> {
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis);

  // ----------------- cross Fade State ---------------//
  double _opicity = 0.3;

  void chanageOpacity() {
    setState(
      () {
        if (_opicity == 0.3) {
          _opicity = 1.0;
        } else {
          _opicity = 0.3;
        }
      },
    );
  }
  // ----------------- cross Fade State ---------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ope animation")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //-- --- --- -- --- -AnimatedCrossFade ---- --- --- -- //

            AnimatedOpacity(
              opacity: _opicity,
              duration: const Duration(seconds: 1),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * .9,
                color: Colors.pink,
                child: Center(child: Text("second", style: _textStyle)),
              ),
            ),

            //---- space ------//
            const SizedBox(
              height: 15.0,
            ),
            //--------------  design action --------------//
            Container(
              color: Colors.amber.shade600,
              height: 50.0,
              width: MediaQuery.of(context).size.width * .9,
              child: TextButton(
                onPressed: () => chanageOpacity(),
                child: Center(
                  child: Text(
                    "change opacity",
                    style: _textStyle,
                  ),
                ),
              ),
            ),
            //--------------  End Column --------------//
          ],
        ),
      ),
    );
  }
}

