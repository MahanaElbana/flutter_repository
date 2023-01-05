import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

  /////////////                ////////////////
  bool enable = false;
  void togleObscure() {
    if (enable == false) {
      setState(() {
        enable = true;
      });
    } else {
      setState(() {
        enable = false;
      });
    }
  }

  String _labelText = "";
  TextEditingController _controller = TextEditingController();
  String contentText = "";

  /////////////             ////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ////////////    TextField     ////////////
            Container(
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                /////    decoration: InputDecoration  /////
                decoration: InputDecoration(
                  ///////////
                  filled: true,
                  fillColor: Colors.purple,
                  /////////
                  hintText: "login in ",
                  hintStyle: TextStyle(color: Colors.red),
                  labelText: _labelText,
                  labelStyle: TextStyle(color: Colors.red),
                  ////  border  ==> start ///
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                  ),

                  ////  border  ///
                  /////   enabledBorder enabled start shape////
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                  ),
                  /////   enabledBorder ////

                  ////////   focusedBorder at writting  ////
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Colors.green, width: 4.0),
                  ),
                  ////////   focusedBorder ////

                  suffixIcon: IconButton(
                    icon: enable
                        ? Icon(Icons.visibility_off_outlined,
                            color: Colors.grey)
                        : Icon(Icons.visibility_outlined, color: Colors.yellow),
                    onPressed: togleObscure,
                  ),
                  prefixIcon: Icon(Icons.keyboard, color: Colors.red),
                  suffix: enable
                      ? Text("show", style: TextStyle(color: Colors.grey))
                      : Text("hide", style: TextStyle(color: Colors.yellow)),
                ),
                /////////     decoration: InputDecoration   ////////
                controller: _controller,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.amber,
                cursorHeight: 27.0,
                cursorRadius: Radius.circular(25),
                cursorWidth: 10.0,
                showCursor: true,
                obscureText: enable,
                autocorrect: true,
                textInputAction: TextInputAction.done,

                /// do any thing  at press on submitted
                onEditingComplete: () => print("okay "),

                /// take value from text content at press on submitted
                onSubmitted: (String vale) => print(vale),
                // Called when the user initiates a change to the TextField's value:
                // when they have inserted or deleted text.
                onChanged: (value) {
                  setState(() {
                    _labelText = value;
                  });
                },
               ///////////   onChanged /////////// 
              ),

            ),

            ////////////    TextField     ////////////
            /// ////////   TextButton  ////
            TextButton(
              child: Icon(Icons.get_app),
              onPressed: () {
                setState(() {
                  contentText = _controller.text;
                });
                print(contentText);
              },
            )
            ////////   TextButton  ////
          ],
        ),
      ),
    );
  }
}
