import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

void main() async {
  // 1] -----------  Initialize storage driver with await -------
  // Start the storage drive.
  // It's important to use await before calling this API, or side effects will occur.
  await GetStorage.init();
  // 1] -----------  Initialize storage driver with await -------
  runApp(App());
}

class ThemeController extends GetxController {
  /////////////// example on theme  /////////////////

  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.purple,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFf4445E5),
    accentColor: Colors.yellow,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    buttonColor: Colors.blue,
  );

  ////---------- how to use [get_storage]  ----------/////
  ////// example on theme  /////////////////
  final box = GetStorage();

  bool get isDark => box.read('darkmode') ?? false; // read

  ThemeData get theme => isDark ? darkTheme : lightTheme;

  void changeTheme(bool val) {
    box.write('darkmode', val);
    update();
  } //write

  ///// Example on Counter using Get and get_storage //////////
  int _count = 0;
  int get count => box.read("cont") ?? 0;
  void increment() {
    _count++;
    box.write("cont", _count);
    update();
  }
  ////---------- how to use [get_storage]  ----------/////
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ////---------- 1- instance /////
    final themeController = Get.put(ThemeController());

    ///-------------  [update()]   with   [GetBuilder()]
    return GetBuilder<ThemeController>(
      init: themeController,
      builder: (controller) => GetMaterialApp(
        theme: themeController.theme,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Theme using [get_storage]"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: SwitchListTile(
                  value: controller.isDark,
                  title: Text("chabge theme"),
                  onChanged: controller.changeTheme,
                ),
              ),
              TextButton(
                  onPressed: controller.increment,
                  child: Text("count ${controller.count}"))
            ],
          ),
        ),
      ),
    );
  }
}
