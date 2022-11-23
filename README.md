# Flutter Repository 💚

## Topics 🔭

 - Flutter common commands .
 - Project Structure . 
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



# How to upload flutter application on google play 🚀
 -  Go to the following link 
    ```
    https://docs.flutter.dev/deployment/android
    ```
    - Create an upload keystore 

- Copy key to the following path in flutter project 
    - **flutter project** 
        - **android**
            - **app**     
                - **upload-keystore.jks**

- Create file with name **key.properties** in the following path 
   - **android**
      - **key.properties** 

- Go to this file **key.properties** and add 
    - **Reference the keystore from the app**
    ```
    storePassword=password
    keyPassword=password
    keyAlias=upload
    storeFile=../app/upload-keystore.jks
    ``` 

- Go to the following path 
  
  - android 
    - app
      -  build.gradle
  - then apply 
   ```
   Configure signing in gradle
   ```  
- Go to   **.gitignore** and the add 
   ```
     **/android/key.properties
     **/android/app/upload-keystore.jks
   ```


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