import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return GetBuilder<ThemeController>(
      init: themeController,
      builder: (controller) {
        return GetMaterialApp(
          // light theme
          theme: themeController.lightThemCreated,
          //  dark Theme
          darkTheme: themeController.darkThemCreated,
          //   themeMode
          themeMode: controller.thememode,
          debugShowCheckedModeBanner: false,
          home: ThemeModeGet(),
        );
      },
    );
  }
}

class ThemeController extends GetxController {
  /////////////   lightTheme ///////////////
  final lightThemCreated = ThemeData(
    primaryColor: Colors.indigoAccent[700],
    canvasColor: Colors.white,
    backgroundColor: Colors.yellow,
    accentColor: Colors.pink,
    bottomAppBarColor: Colors.cyan,
    buttonColor: Colors.deepOrange,
    cardColor: Colors.white,
    cardTheme: CardTheme(elevation: 6),
    secondaryHeaderColor: Colors.deepOrange,
    iconTheme: IconThemeData(color: Colors.grey),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      ),
    ),
  );
  /////////////   darkTheme ///////////////
  final darkThemCreated = ThemeData(
    /// appBar
    primaryColor: Color(0xFF1F1F1F),

    /// bodycolor ==> Scaffold color
    canvasColor: Color(0xff121212),

    backgroundColor: Colors.green,
    ////////////////  FloatingActionButton
    accentColor: Color(0xffbb8cfc),

    bottomAppBarColor: Colors.purple,
    buttonColor: Colors.blueGrey,
    cardColor: Color(0xff1e1e1e),
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: 25),
    ).apply(
      bodyColor: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Color(0xffbb8cfc),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xff1e1e1e),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xffbb8cfc),
        ),
      ),
    ),
  );

  final box = GetStorage();

  bool get isdark => box.read("mode") ?? false;
  ThemeMode get thememode =>
      box.read("mode") == true ? ThemeMode.dark : ThemeMode.light;

  changeTheme(bool value) {
    box.write("mode", value);

    update();
  }
}

class ThemeModeGet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Analytics"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0.9),
            child: Row(
              children: [
                Icon(Icons.person),
                Icon(Icons.sailing),
              ],
            ),
          )
        ],
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("body text 2"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("light mode"),
                SizedBox(
                  width: 18,
                ),
                Container(
                  child: GetBuilder<ThemeController>(
                    builder: (controller) {
                      return Switch(
                          value: themeController.isdark,
                          onChanged: themeController.changeTheme);
                    },
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Text("dark mode"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Center(
                    child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Center(child: Text("hi card"))),
                  ),
                ),
                Card(
                  child: Center(
                    child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Center(child: Text("hi card"))),
                  ),
                ),
              ],
            ),
            TextButton(onPressed: () {}, child: Text("TextButton")),
            IconButton(onPressed: () {}, icon: Icon(Icons.holiday_village))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.alarm),
      ),
    );
  }
}
