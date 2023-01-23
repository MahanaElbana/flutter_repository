# Flutter Repository 💚

## Topics 🔭

 - Flutter common commands .
 - Project Structure . 
 - upload flutter application on google play
 - Flutter Urls .
 - Algorithms . 
 - Basic Widgets .

### Flutter common commands 😊

  - How to build android app (apk) ☄️
    ```
    flutter build apk
    ```
  - How to extract (AAB) app  ☄️ 
    ```
    flutter build appbundle --release
    ```
  - How to Run flutter project ☄️
    ```
    flutter run 
    flutter run -d "device_name"
    flutter run -d linux 
    flutter run -d chrome 
    ```   
  - How to find available devices on flutter ☄️
    ```
    flutter devices 
    ``` 
  - How to create Linux files if they don't exist ☄️
    ```
    flutter create --platforms=linux .
    ``` 
  - How to create multiple platform files if they don't exist ☄️
    ```
    flutter create  .
    ```   
  - How to  delete the build/ and .dart_tool/ directories. ☄️
    ```
    flutter clean
    ``` 
  - How to create a new Flutter project in the specified directory ☄️
    ```
    flutter create "the name of project"
    ```  
  - How to add external package from [pub.dev](https://pub.dev/) ☄️
    ```
    flutter pub add "the name of package"
    ```   
  - How to manually install any package ☄️
    ```
    flutter pub get
    ```   
  - How to print inforamtion about usage certain command ☄️
    ```
    flutter run --help
    flutter run -h 
    ```

### Flutter project structure 😊

  - Where is the path of (AndroidManifest.xml) ☄️
    ```
    fluuter_project
       android 
           app 
             src
               main 
                 AndroidManifest.xml
    ```

## Github command to push the project 😄

```
git add . && git commit -m "the last commit" && git push
```

### Upload flutter application on google play 😊
  1. the videos 
    - [Flutter & Google Play Store](https://www.youtube.com/watch?v=_enL3bRiHVI)

  2. Go to Android Asset Studio to Launcher icon generator : 
   [Launcher icon generator](https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html#foreground.type=clipart&foreground.clipart=android&foreground.space.trim=1&foreground.space.pad=0.25&foreColor=rgba(96%2C%20125%2C%20139%2C%200)&backColor=rgb(68%2C%20138%2C%20255)&crop=0&backgroundShape=circle&effects=none&name=ic_launcher) ☄️
  
  3. Go to *flutter_project/pubspec.yaml* and add *log_forground.png* in assets ☄️
     ``` pubspec.yaml
     
     dev_dependencies:
       flutter_test:
         sdk: flutter
       flutter_launcher_icons:  
     
     flutter_icons:
       android: true
       ios: true
       image_path: "assets/images/icon_logo.png"
       adaptive_icon_background: "#ffffff"
       adaptive_icon_foreground: "assets/images/log_forground.png"     
     ```
  4. Run the *flutter_launcher_icons* package ☄️
     ```  
     flutter pub get
     flutter pub run flutter_launcher_icons
     ```  
  5. Go to (Flutter Launcher Icons)[https://pub.dev/packages/flutter_launcher_icons] ☄️
  
  6. Go to the following link : [Build and release an Android app](https://docs.flutter.dev/deployment/android) ☄️
     
  7. Signing the app (Create an upload keystore) : [Signing the app](https://docs.flutter.dev/deployment/android#signing-the-app) ☄️

  8. Add the key to the following path in flutter project  ☄️
     - **flutter project** 
        - **android**
            - **app**     
                - **upload-keystore.jks**

  9.  Create file with name **key.properties** in the following path ☄️
    - **android**
       - **key.properties** 

  10. Go to this file **key.properties** and add ☄️
    - **Reference the keystore from the app**
     ```
     storePassword=password
     keyPassword=password
     keyAlias=upload
     storeFile=../app/upload-keystore.jks
     ``` 

  11. from [Signing the app] apply [**Configure signing in gradle**] in the following path ☄️
     ```
     android 
         app
          build.gradle
     ```

  12. Go to **.gitignore** and the add ☄️
     ```
     **/android/key.properties
     **/android/app/upload-keystore.jks
     ```
## Flutter Urls 😊
 - [flutter repo on github](https://github.com/MahanaElbana/flutter_repository/blob/main/README.md) ☄️
 - [Build and release an Android app](https://docs.flutter.dev/deployment/android#signing-the-app) ☄️
 - [Flutter Launcher Icons ](https://pub.dev/packages/flutter_launcher_icons) ☄️
 - [rename](https://pub.dev/packages/rename) ☄️
 - [How to upload and publish the flutter App on the Google Play Store](https://youtu.be/_enL3bRiHVI) ☄️

## under updating 
```flutter
 initialRoute: Navigator.defaultRouteName,
 or 
 initialRoute:'/',
```

```

class AnimatedMainScreenDrawer extends StatefulWidget {
  const AnimatedMainScreenDrawer({Key? key}) : super(key: key);

  @override
  State<AnimatedMainScreenDrawer> createState() =>
      _AnimatedMainScreenDrawerState();
}

class _AnimatedMainScreenDrawerState extends State<AnimatedMainScreenDrawer> {
  double changedValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('kjkk'),
        leading: IconButton(
            icon: Icon(Icons.ac_unit_rounded),
            onPressed: () {
              setState(() {
                changedValue == 0 ? changedValue = 1.0 : changedValue = 0.0;
              });
            }),
      ),
      body: SafeArea(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.0, end: changedValue),
          duration: const Duration(milliseconds: 1000),
          builder: (__, double value, _) {
            return (
                    //////////////////////
                    Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(0, 3, 200 * value)
                ..rotateY((pi / 6.0) * value),
            )
                /////////////////////
                );
          },
          child: Scaffold(
              backgroundColor: Colors.red,
              body: Text("ds"),
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Text('kjkk'),
                leading: IconButton(
                    icon: Icon(Icons.ac_unit_rounded),
                    onPressed: () {
                      setState(() {
                        changedValue == 0
                            ? changedValue = 1.0
                            : changedValue = 0.0;
                      });
                    }),
              )),
        ),
      ),
    );
  }
}

```
# ght

```
  Widget buildBottomNavigation() => BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      );

```
## Flutte Route

```dart
class RoutePage {
  static Route? onRoutePage(RouteSettings setting) {
    if (setting.name == Navigator.defaultRouteName) {
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    } else if (setting.name == ScreenName.drawerScreen) {
      return MaterialPageRoute(
        builder: (_) => const ZoomDrawerScreen(),
      );
    } else if (setting.name == ScreenName.cardListAnimation) {
      return MaterialPageRoute(
        builder: (_) => const CardListAnimation(),
      );
    } else if (setting.name == ScreenName.subCategories) {
      return MaterialPageRoute(
        builder: (_) => const SubCategories(),
      );
    } else if (setting.name == ScreenName.transformOne) {
      return MaterialPageRoute(
        builder: (_) => const TransformOne(),
      );
    }
    // ====================== if route not founded ================//
    else {
      return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Route NOT FOUND !'),
            ),
            body: const Text('Route NOT FOUND !'),
          );
        },
      );
    }
    // ====================== if route not founded ================//
  }
}
```

```dart
 PopupMenuButton<int>(
            initialValue: view,
            onSelected: (int index) {
              if (view != index) {
                view = index;
              }
              Navigator.of(context).pushReplacement(
                  _createRoute(const ListViewGridViewAnimation()));
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Switch to GridView'),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Switch to ListView'),
                ),
                const PopupMenuDivider(),
              ];
            },
          ),
        ],
        elevation: 0.0,
      ),
```