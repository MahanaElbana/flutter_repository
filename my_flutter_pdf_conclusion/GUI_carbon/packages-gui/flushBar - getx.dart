import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';

////////////            Flushbar   replace [ Snackbars and Toasts ]      ////////////////////
//A flexible widget for user notification . Customize your text
// button, duration, animations and much more.
/// For Android devs, it is made to replace [ Snackbars and Toasts ]
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var flushbarController = Get.put(FlushbarController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text(flushbarController.title.value)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                child: Text("HideTitle"),
                onPressed: () async {
                  ///////// ----------------     ------  Flushbar ----------------/////////
                  flushbarController.deleteTitle();
                  /////// Flushbar /////////////
                  Flushbar(
                    borderColor: Colors.brown,
                    // barBlur: 30.0,
                    borderRadius: BorderRadius.circular(12.0),
                    borderWidth: 4.0,

                    duration: Duration(seconds: 5),
                    flushbarPosition: FlushbarPosition.TOP,
                    mainButton: IconButton(
                        icon: Icon(Icons.accessibility),
                        onPressed: () => flushbarController.showTitle()),
                    backgroundColor: Colors.amber,
                    backgroundGradient:
                        LinearGradient(colors: [Colors.green, Colors.yellow]),
                    messageText: Text("this is flushBar"),
                    icon: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context)),
                  )..show(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlushbarController extends GetxController {
  RxString title = "UI Widget".obs;

  deleteTitle() {
    title.value = "";
  }

  showTitle() {
    title.value = "UI Widget";
  }
}
