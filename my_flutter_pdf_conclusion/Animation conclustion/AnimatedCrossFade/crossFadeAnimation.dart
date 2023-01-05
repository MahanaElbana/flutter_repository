import 'package:flutter/material.dart';

class CustomAnimatedCrossFade extends StatefulWidget {
  const CustomAnimatedCrossFade({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedCrossFade> createState() =>
      _CustomAnimatedCrossFadeState();
}

class _CustomAnimatedCrossFadeState extends State<CustomAnimatedCrossFade> {
  
  final TextStyle _textStyle =  const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis);

  // ----------------- cross Fade State ---------------//
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  void chanageCrossFadeState(){
                  setState(
                    () {
                      if (_crossFadeState == CrossFadeState.showFirst) {
                        _crossFadeState = CrossFadeState.showSecond;
                      } else {
                        _crossFadeState = CrossFadeState.showFirst;
                      }
                    },
                  );
                }
  // ----------------- cross Fade State ---------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("cross fade animation")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //-- --- --- -- --- -AnimatedCrossFade ---- --- --- -- //
            AnimatedCrossFade(
              firstChild: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * .9,
                color: Colors.purple,
                child:  Center(child: Text("first" , style:_textStyle)),
              ),
              secondChild: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * .9,
                color: Colors.pink,
                child:  Center(child: Text("second" ,style:_textStyle)),
              ),
              crossFadeState: _crossFadeState,
              duration: const Duration(seconds: 2),
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
                onPressed: ()=> chanageCrossFadeState() ,  
                child:  Center(
                    child: Text(
                  "change _cross Fade State",
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

