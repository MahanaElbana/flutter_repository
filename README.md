## flutter_repository 💚
All widgets and algorithms which you want to know about flutter 
# How do you Manage your Flutter app development ?

##   📝 📝 ***Common flutter commands*** 📝📝
## 1] Create a new Flutter project in the specified directory 
```shell
flutter create "the name of project"
```
## 2] Run your Flutter application on an attached device or in an emulator.
```
flutter run [options] 
``` 
----
##   👨‍🏫 👨‍🏫 ***usage flutter commands*** 👨‍🏫👨‍🏫
### 1] flutter **[command]** [arguments] 
### 2] flutter **[command]** [options]  
### ***Example*** :trophy:
```
flutter run --help
flutter run -h 
```
---
##   :o: ***Global flutter options*** 
### 1] Print inforamtion about usage certain command 
```
-h , --help
flutter run --help
flutter run -h
```
---
##   :a: ***Available flutter commands***  
### 1]  Delete the build/ and .dart_tool/ directories.
```
clean     
```
### 2] showing List all connected devices. 
```
devices
```
### 3] :package: Commands for managing Flutter packages :package:
```
flutter pub add "the name of package"
```
### 4] :package:  Anather Command for managing Flutter packages :package:
  - firstly add package in ***[ pubspec.yaml ]*** 
  - and then run the following command 
    - ```
       flutter pub get
 ``` 
---

# 

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