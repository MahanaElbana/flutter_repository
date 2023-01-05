import 'package:flutter/material.dart';

class ProfileInAppBar extends StatefulWidget {
  const ProfileInAppBar({super.key});

  @override
  State<ProfileInAppBar> createState() => _ProfileInAppBarState();
}

class _ProfileInAppBarState extends State<ProfileInAppBar> {
  bool isOpend = false;
  String btnText = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 160,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 20,
              left: width * 0.5 - 60,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                height: 120,
                width: 120,
              ),
            ),
            //======= === ==== ====== ===//
            Positioned(
              top: 24,
              left: width * 0.5 - 56,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(56),
                ),
                height: 112,
                width: 112,
                child: Center(
                    child: Icon(
                  Icons.person,
                  color: Colors.indigo.shade900,
                  size: 80,
                )),
              ),
            ),
                 //===== ======= ====== =====//
            Positioned(
              top: 25,
              left: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 40,
                width: 40,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.canPop(context) ? Navigator.pop(context) : null;
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
             //====== ==== ======= ======//
        actions: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.heart_broken),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.wifi_protected_setup_outlined),
                  ),
                ),
              ],
            ),
          )
        ],
      //===== ===== ===== ========//

      ),

    
    );
  }
}
