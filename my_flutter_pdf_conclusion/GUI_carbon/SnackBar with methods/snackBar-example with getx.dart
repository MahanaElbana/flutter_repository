import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var snackBarController = Get.put(SnackBarController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text(snackBarController.title.value)),
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
                onPressed: () {
                  ///////// ----------------     ------  SnackBar ----------------/////////
                  snackBarController.deleteTitle();
                  /////// snackBar /////////////
                  final SnackBar snackBar = SnackBar(
                    content: Container(
                      child: Text("SnackBar"),
                    ),
                    action: SnackBarAction(
                      label: "showTitle",
                      onPressed: () => snackBarController.showTitle(),
                    ),
                    backgroundColor: Colors.amber,
                    duration: Duration(seconds: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(18.0),
                    elevation: 100.0,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SnackBarController extends GetxController {
  RxString title = "UI Widget".obs;

  deleteTitle() {
    title.value = "";
  }

  showTitle() {
    title.value = "UI Widget";
  }
}
