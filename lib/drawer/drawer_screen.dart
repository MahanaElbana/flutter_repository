
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


      //===== main screen  and menu screen ==============//
       mainScreen: const MainScreenDrawer(),
       menuScreen: const MenuScreenDrawer(),
      //===== main screen  and menu screen ==============//
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
             const ListTile(
                title:  Text('عبر الهاتف',
                    style: TextStyle(color: Colors.black, fontSize: 22.0 ,fontFamily: 'NotoNaskhArabic')),
                leading: Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 0, 27, 200),
                ),
              ),
              const SizedBox(height: 4.0),
              ListTile(
                title: const Text('الفيس بوك',
                    style: TextStyle(color: Colors.black, fontSize: 22.0 ,fontFamily: 'NotoNaskhArabic')),
                leading: Icon(
                  Icons.facebook,
                  color: Colors.blue.shade800,
                ),
              ),
            
              const SizedBox(height: 4.0),
              ListTile(
                title: const Text('الموقع الجغرافي',
                    style: TextStyle(color: Colors.black, fontSize: 22.0 ,fontFamily: 'NotoNaskhArabic')),
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.redAccent.shade700,
                ),
              ),
             
                const SizedBox(height: 30.0),
              const Tooltip(message: "mahney mohsen mohamed elbana",

                child: ListTile(
                  title:  Text('حول المطور',
                      style: TextStyle(color: Colors.black87, fontSize: 22.0 ,fontFamily: 'NotoNaskhArabic')),
                  leading: Icon(
                    Icons.code_outlined,
                    color: Color.fromARGB(255, 55, 5, 87),
                  ),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('main screen'), actions: [
        IconButton(
            onPressed: () {

              //================= action =================//
              ZoomDrawer.of(context)!.toggle();
              //================= action =================//
            },
            icon: const Icon(Icons.menu))
      ]),
    );
  }
}
