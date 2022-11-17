import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      isRtl: true,
      menuBackgroundColor: Colors.amber,
      borderRadius: 24.0,
      showShadow: true,
      angle: -4.0,
      drawerShadowsBackgroundColor: Colors.amber.shade200,
      slideWidth: MediaQuery.of(context).size.width * .80,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      mainScreen: const MainScreenDrawer(),
      menuScreen: const MenuScreenDrawer(),
    );
  }
}

class MenuScreenDrawer extends StatelessWidget {
  const MenuScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 35,
              ),

              // ================ CircleAvatar =====================//
              CircleAvatar(
                radius: 74.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 70,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),

              // =================================================//
              const SizedBox(height: 60),
              const Text('تواصل بنا',
                  style: TextStyle(color: Colors.white, fontSize: 31.0 , fontFamily: 'NotoNaskhArabic')),
              const SizedBox(height: 35),
              ListTile(
                title: const Text('واتساب',
                    style: TextStyle(color: Colors.black, fontSize: 22.0 ,fontFamily: 'NotoNaskhArabic')),
                leading: Icon(
                  Icons.whatsapp,
                  color: Colors.greenAccent.shade700,
                ),
              ),
              const SizedBox(height: 4.0),
              ListTile(
                title: const Text('الفيس',
                    style: TextStyle(color: Colors.black, fontSize: 22.0 ,fontFamily: 'NotoNaskhArabic')),
                leading: Icon(
                  Icons.facebook,
                  color: Colors.blue.shade800,
                ),
              ),
              const SizedBox(height: 4.0),
              ListTile(
                title: const Text('واتساب',
                    style: TextStyle(color: Colors.black, fontSize: 22.0 ,fontFamily: 'NotoNaskhArabic')),
                leading: Icon(
                  Icons.whatsapp,
                  color: Colors.greenAccent.shade700,
                ),
              ),
              const SizedBox(height: 4.0),
              ListTile(
                title: const Text('الفيس',
                    style: TextStyle(color: Colors.black, fontSize: 22.0 ,fontFamily: 'NotoNaskhArabic')),
                leading: Icon(
                  Icons.facebook,
                  color: Colors.blue.shade800,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class MainScreenDrawer extends StatefulWidget {
  const MainScreenDrawer({Key? key}) : super(key: key);

  @override
  State<MainScreenDrawer> createState() => _MainScreenDrawerState();
}

class _MainScreenDrawerState extends State<MainScreenDrawer> {
  bool isOpenDrawerState = false;

  @override
  Widget build(BuildContext context) {
    //print(_drawerController.isOpen);

    // print(_drawerController.stateNotifier!.value);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('main screen'), actions: [
        IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: const Icon(Icons.menu))
      ]),
    );
  }
}

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
